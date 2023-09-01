#!/bin/bash
echo "########################################################"
echo "#                                                      #"
echo "#                                                      #"
echo "#                                                      #"
echo "#                    稳健OJ管理系统                    #" 
echo "#                                                      #"
echo "#                   by:养正稳健IT社                    #"
echo "#                                                      #"
echo "#                                                      #"
echo "########################################################"
echo ""
echo ""
echo "1.khoi dong"
echo "2.kiem tra trang thai"
echo "3.thay moi"
echo "4.ho tro"
echo "5.Nhap du lieu(bate)"
echo "6.khoi dong lai"
echo "7.Tat"
read -p "nhap so thu tu：" num
if [ "$num" == "1" ]
    then
    docker-compose up -d
    read -s -p "Nhan Enter de tiep tuc……" continue
    reset
    ./oj.sh
elif [ "$num" == "2" ]
    then
    docker ps -a
    read -s -p "Nhan Enter de tiep tuc" continue
    reset
    ./oj.sh
elif [ "$num" == "3" ]
    then
    git pull
    docker-compose pull && docker-compose up -d
    read -s -p "Nhan Enter de tiep tuc...." continue
    reset
    ./oj.sh
elif [ "$num" == "4" ]
    then
    cp -r data data_bak
    read -s -p "Sao luu hoan tat, nhan enter de tiep tuc..." continue
    reset
    ./oj.sh
elif [ "$num" == "5" ]
    then
    echo "请确保题库文件已导入 /home/OnlineJudgeDeploy/data/backend/test_case 文件夹中"
    read -s -p "按回车键继续……" continue
    docker cp old_data.json oj-backend:/app/utils/
    docker exec -it oj-backend /bin/sh
    cd ./utils
    python3 migrate_data.py old_data.json
    read -s -p "Nhan Enter de tiep tuc" continue
    reset
    ./oj.sh
elif [ "$num" == "6" ]
    then
    docker-compose restart
    read -s -p "Nhan Enter de tiep tuc" continue
    reset
    ./oj.sh
elif [ "$num" == "7" ]
    then
    docker-compose stop
    read -s -p "Nhan Enter de tiep tuc" continue
    reset
    ./oj.sh
fi
