alias ApiStack.Repo
alias ApiStack.Stack.Manager

Repo.insert! %Manager{
  title: "Slack",
  usage: "Messenger bot integrated with full stack api",
  status: "Unconfigured"
}

Repo.insert! %Manager{
  title: "Gmail",
  usage: "Automation actions enabled email monitoring",
  status: "Unconfigured"
}

Repo.insert! %Manager{
  title: "Google Drive",
  usage: "Accessing and managing google drive files and content",
  status: "Unconfigured"
}
