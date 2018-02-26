defmodule TaskTracker2.WorkTest do
  use TaskTracker2.DataCase

  alias TaskTracker2.Work

  describe "tasks" do
    alias TaskTracker2.Work.Task

    @valid_attrs %{body: "some body", finished: true, title: "some title"}
    @update_attrs %{body: "some updated body", finished: false, title: "some updated title"}
    @invalid_attrs %{body: nil, finished: nil, title: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Work.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Work.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Work.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Work.create_task(@valid_attrs)
      assert task.body == "some body"
      assert task.finished == true
      assert task.title == "some title"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Work.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = Work.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.body == "some updated body"
      assert task.finished == false
      assert task.title == "some updated title"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Work.update_task(task, @invalid_attrs)
      assert task == Work.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Work.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Work.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Work.change_task(task)
    end
  end

  describe "managements" do
    alias TaskTracker2.Work.Management

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def management_fixture(attrs \\ %{}) do
      {:ok, management} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Work.create_management()

      management
    end

    test "list_managements/0 returns all managements" do
      management = management_fixture()
      assert Work.list_managements() == [management]
    end

    test "get_management!/1 returns the management with given id" do
      management = management_fixture()
      assert Work.get_management!(management.id) == management
    end

    test "create_management/1 with valid data creates a management" do
      assert {:ok, %Management{} = management} = Work.create_management(@valid_attrs)
    end

    test "create_management/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Work.create_management(@invalid_attrs)
    end

    test "update_management/2 with valid data updates the management" do
      management = management_fixture()
      assert {:ok, management} = Work.update_management(management, @update_attrs)
      assert %Management{} = management
    end

    test "update_management/2 with invalid data returns error changeset" do
      management = management_fixture()
      assert {:error, %Ecto.Changeset{}} = Work.update_management(management, @invalid_attrs)
      assert management == Work.get_management!(management.id)
    end

    test "delete_management/1 deletes the management" do
      management = management_fixture()
      assert {:ok, %Management{}} = Work.delete_management(management)
      assert_raise Ecto.NoResultsError, fn -> Work.get_management!(management.id) end
    end

    test "change_management/1 returns a management changeset" do
      management = management_fixture()
      assert %Ecto.Changeset{} = Work.change_management(management)
    end
  end

  describe "time_blocks" do
    alias TaskTracker2.Work.TimeBlock

    @valid_attrs %{end: ~N[2010-04-17 14:00:00.000000], start: ~N[2010-04-17 14:00:00.000000]}
    @update_attrs %{end: ~N[2011-05-18 15:01:01.000000], start: ~N[2011-05-18 15:01:01.000000]}
    @invalid_attrs %{end: nil, start: nil}

    def time_block_fixture(attrs \\ %{}) do
      {:ok, time_block} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Work.create_time_block()

      time_block
    end

    test "list_time_blocks/0 returns all time_blocks" do
      time_block = time_block_fixture()
      assert Work.list_time_blocks() == [time_block]
    end

    test "get_time_block!/1 returns the time_block with given id" do
      time_block = time_block_fixture()
      assert Work.get_time_block!(time_block.id) == time_block
    end

    test "create_time_block/1 with valid data creates a time_block" do
      assert {:ok, %TimeBlock{} = time_block} = Work.create_time_block(@valid_attrs)
      assert time_block.end == ~N[2010-04-17 14:00:00.000000]
      assert time_block.start == ~N[2010-04-17 14:00:00.000000]
    end

    test "create_time_block/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Work.create_time_block(@invalid_attrs)
    end

    test "update_time_block/2 with valid data updates the time_block" do
      time_block = time_block_fixture()
      assert {:ok, time_block} = Work.update_time_block(time_block, @update_attrs)
      assert %TimeBlock{} = time_block
      assert time_block.end == ~N[2011-05-18 15:01:01.000000]
      assert time_block.start == ~N[2011-05-18 15:01:01.000000]
    end

    test "update_time_block/2 with invalid data returns error changeset" do
      time_block = time_block_fixture()
      assert {:error, %Ecto.Changeset{}} = Work.update_time_block(time_block, @invalid_attrs)
      assert time_block == Work.get_time_block!(time_block.id)
    end

    test "delete_time_block/1 deletes the time_block" do
      time_block = time_block_fixture()
      assert {:ok, %TimeBlock{}} = Work.delete_time_block(time_block)
      assert_raise Ecto.NoResultsError, fn -> Work.get_time_block!(time_block.id) end
    end

    test "change_time_block/1 returns a time_block changeset" do
      time_block = time_block_fixture()
      assert %Ecto.Changeset{} = Work.change_time_block(time_block)
    end
  end
end
