#!/bin/sh

echo -e "\033[32m 欢迎使用linux一键开服脚本绿色字 \033[0m"
echo -e "\033[31m 本脚本只支持Ubuntu/Debian系统! \033[0m"
echo -e "1=bds=安装wine+BDS+LLSE"
echo -e "2=nukkit=安装java17+Nukkit最新版"
echo -e "3=about=脚本信息"
echo -e "4=quit=quit"

PS3='输入名称: '
foods=("bds" "nukkit" "about" "quit")
select fav in "${foods[@]}"; do
    case $fav in
        "bds")
            echo "开始安装bds+llse"
            echo "创建目录"
            sudo mkdir /home/ubuntu/BDSLLSE
            cd /home/ubuntu/BDSLLSE
            echo "创建目录完成"
            echo "开始安装wget"
            sudo apt-get install wget
            echo "wget安装完成"
            echo "开始安装wine"
            sudo apt-get install wine
            echo "wine安装完成开始配置wine"
            winecfg
            echo "wine配置完成"
            echo "为了避免出错进行第二次CD"
            cd /home/ubuntu/BDSLLSE
            echo "CD完成"
            echo "开始从服务器下载BDS整合包"
            echo "下载可能较慢，请耐心等待"
            wget http://106.14.14.210/winbds.tar.gz
            echo "BDS整合包下载完成，开始解压"
            tar -zxvf winbds.tar.gz
            echo "解压完成，开始运行"
            wine bedrock_server_mod.exe
            echo "233，可能运行成功了吧，我这机子是ARM的没测试，按理来说是成功的"


	    # BDS+LLSE
            ;;
        "nukkit")
            echo "开始安装Nukkit+JAVA17"
            echo "欢迎使用Arzxq自动开Nukkit服务器"
            echo "当前脚本版本0.1,安装的Nukkit版本为:git-8a276f8 版本 "" (API 1.0.13) BE1.18.10"
            echo "本脚本只支持AMD64或者ARM64"
            echo "开始安装java17>>>>>>>>>>>>>>>>>>>>"
            sudo apt install openjdk-17-jre-headless
            echo "java17安装完成>>>>>>>>>>>>>>>>>>>>"
            echo "创建文件夹&cd>>>>>>>>>>>>>>>>>>>>"
            sudo mkdir /home/ubuntu/Nukkit
            cd /home/ubuntu/Nukkit
            echo "下载Nukkit git-8a276f8 版本>>>>>>>>>>>>>>>>>>>>"
            echo "如提示错误请安装wget 命令:sudo apt-get install wget"
            wget https://ci.opencollab.dev//job/NukkitX/job/Nukkit/job/master/lastSuccessfulBuild/artifact/target/nukkit-1.0-SNAPSHOT.jar
            echo "下载Nukkit git-8a276f8 版本完成>>>>>>>>>>>>>>>>>>>>"
            echo "开始启动Nukkit>>>>>>>>>>>>>>>>>>>>"
            java -server -jar nukkit-1.0-SNAPSHOT.jar
	    # NK
            ;;
        "about")
            echo "\033[34m 脚本作者:Arzxq 脚本版本:1.3 TsPod官网&脚本更新网站:http://www.arzxq.com \033[0m"
	    # 插件信息
	    break
            ;;
	"quit")
	    echo "退出......"
	    exit
	    ;;
        *) echo "无效输入 $REPLY";;
    esac
done
