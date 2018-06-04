alias ApiStack.Repo
alias ApiStack.Stack.Operation

Repo.insert! %Operation{
  manager_id: 1,
  tasks: 1,
  completed: 0,
  running: false
}

Repo.insert! %Operation{
  manager_id: 2,
  tasks: 1,
  completed: 0,
  running: false
}

Repo.insert! %Operation{
  manager_id: 3,
  tasks: 1,
  completed: 0,
  running: false
}
