defmodule Mailbox do
  def start do
    spawn(fn -> loop() end)
  end

  def loop do
    receive do
      :valid -> IO.puts "Received a valid message!"
      :getothers -> receive do
                      :other -> IO.puts "Received an 'other' message!"
                    after
                      1 -> IO.puts "Didn't find any other messages."
                    end
      # _other -> IO.puts "Received something else... restarting loop."
      #           loop()
    end
    loop()
  end
end

