#!/usr/bin/expect

set timeout 10

set host "s1.ct8.pl"

set username "nono"

set password "xxx"

spawn ssh $username@$host

expect {
    "yes/no" {
        send "yes\r"
        exp_continue
    }

    "Password" {
        send "$password\r"
    }
}

expect {
    "$username@" {
        puts "Logged in to $host as $username"
	sleep 3
        # 执行其他命令


        # 等待10秒钟（根据需要）
        sleep 1

        # 退出
        send "exit\r"
    }
    "Permission denied" {
        puts "Login failed. Check your credentials."
        exit 1
    }
}

expect eof
