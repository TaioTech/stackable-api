defmodule ApiStack.StackTest do
  use ApiStack.DataCase

  alias ApiStack.Stack

  describe "manager" do
    alias ApiStack.Stack.Manager

    @valid_attrs %{title: "some title", usage: "some usage"}
    @update_attrs %{title: "some updated title", usage: "some updated usage"}
    @invalid_attrs %{title: nil, usage: nil}

    def manager_fixture(attrs \\ %{}) do
      {:ok, manager} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Stack.create_manager()

      manager
    end

    test "list_manager/0 returns all manager" do
      manager = manager_fixture()
      assert Stack.list_manager() == [manager]
    end

    test "get_manager!/1 returns the manager with given id" do
      manager = manager_fixture()
      assert Stack.get_manager!(manager.id) == manager
    end

    test "create_manager/1 with valid data creates a manager" do
      assert {:ok, %Manager{} = manager} = Stack.create_manager(@valid_attrs)
      assert manager.title == "some title"
      assert manager.usage == "some usage"
    end

    test "create_manager/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stack.create_manager(@invalid_attrs)
    end

    test "update_manager/2 with valid data updates the manager" do
      manager = manager_fixture()
      assert {:ok, manager} = Stack.update_manager(manager, @update_attrs)
      assert %Manager{} = manager
      assert manager.title == "some updated title"
      assert manager.usage == "some updated usage"
    end

    test "update_manager/2 with invalid data returns error changeset" do
      manager = manager_fixture()
      assert {:error, %Ecto.Changeset{}} = Stack.update_manager(manager, @invalid_attrs)
      assert manager == Stack.get_manager!(manager.id)
    end

    test "delete_manager/1 deletes the manager" do
      manager = manager_fixture()
      assert {:ok, %Manager{}} = Stack.delete_manager(manager)
      assert_raise Ecto.NoResultsError, fn -> Stack.get_manager!(manager.id) end
    end

    test "change_manager/1 returns a manager changeset" do
      manager = manager_fixture()
      assert %Ecto.Changeset{} = Stack.change_manager(manager)
    end
  end

  describe "operations" do
    alias ApiStack.Stack.Operation

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def operation_fixture(attrs \\ %{}) do
      {:ok, operation} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Stack.create_operation()

      operation
    end

    test "list_operations/0 returns all operations" do
      operation = operation_fixture()
      assert Stack.list_operations() == [operation]
    end

    test "get_operation!/1 returns the operation with given id" do
      operation = operation_fixture()
      assert Stack.get_operation!(operation.id) == operation
    end

    test "create_operation/1 with valid data creates a operation" do
      assert {:ok, %Operation{} = operation} = Stack.create_operation(@valid_attrs)
    end

    test "create_operation/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stack.create_operation(@invalid_attrs)
    end

    test "update_operation/2 with valid data updates the operation" do
      operation = operation_fixture()
      assert {:ok, operation} = Stack.update_operation(operation, @update_attrs)
      assert %Operation{} = operation
    end

    test "update_operation/2 with invalid data returns error changeset" do
      operation = operation_fixture()
      assert {:error, %Ecto.Changeset{}} = Stack.update_operation(operation, @invalid_attrs)
      assert operation == Stack.get_operation!(operation.id)
    end

    test "delete_operation/1 deletes the operation" do
      operation = operation_fixture()
      assert {:ok, %Operation{}} = Stack.delete_operation(operation)
      assert_raise Ecto.NoResultsError, fn -> Stack.get_operation!(operation.id) end
    end

    test "change_operation/1 returns a operation changeset" do
      operation = operation_fixture()
      assert %Ecto.Changeset{} = Stack.change_operation(operation)
    end
  end
end
