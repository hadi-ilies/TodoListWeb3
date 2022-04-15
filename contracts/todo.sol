pragma solidity ^0.8.9;

/**
  Note:
    * Once we deploy a smart contract we can not change it
    * With solidity We have a limit of lines of code for a smart contract
**/
contract Todo {

  struct Task {
    uint id;
    uint date;
    string content;
    string author;
    bool isDone;
    uint dateCompleted;
  }

  //mapping type is just like a dict in python or a map in golang
  //NOTE: public means it's public to the contract (just like a class), Also we don't use an array here bcs mapping is more used when we have a collection of data
  mapping(uint => Task) public tasks;
  uint private nextTaskID = 0;

  //Note: an Event is an inheritable member of a contract. An event is emitted, it stores the arguments passed in transaction logs. These logs are stored on blockchain and are accessible using address of the contract till the contract is present on the blockchain.
  event TaskCreated(uint id, uint date, string content, string author, bool done);
  event TaskStatusToggled(uint id, uint date, bool done);

  //Note: memory keyword means that the string will be saved inside de heap
  function createTask(string memory _content, string memory _author) external {
    //block data when the block was mined
    tasks[nextTaskID] = Task(nextTaskID, block.timestamp, _content, _author, false, 0);
    // this how we call an 'event'
    emit TaskCreated(nextTaskID, block.timestamp, _content, _author, false);
    nextTaskID++;
  }

  //NOTE: `view` means that the function is in readonly mode
  function getTasks() external view returns (Task[] memory) {
    //Note: mapping in solidity does NOT have length or size proprety therefore let use nextTaskID NOTE: WE CAN NOT SEND THE MAPPING DIRECTLY
    Task[] memory _tasks = new Task[](nextTaskID);

    for (uint i = 0; i < nextTaskID; i++) {
      _tasks[i] = tasks[i];
    }
    return _tasks;
  }

  function toggledDone(uint id) external {
    // require(tasks[id].date != 0, 'Task does not exist');
    //Solidity `assert` and `require` are co nvenience functions that check invariants, conditions, and throw exceptions
    // require(tasks[id].id != 0, 'Task does not exist');
    Task storage task = tasks[id];
    task.isDone = !task.isDone;
    if (task.isDone == true) {
      task.dateCompleted = block.timestamp;
    }
    else {
      task.dateCompleted = 0;
    }
    emit TaskStatusToggled(id, task.dateCompleted, task.isDone);
  }
}
