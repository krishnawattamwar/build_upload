##########Script for uploading build on live########################
echo " "
echo "----------------------------------------------------------------"
echo -e "Bash script for Uploading build on live"
echo "----------------------------------------------------------------"
echo " "

#qa project path of krishna pc
cd /home/user/repo/qa

echo " "
echo "qa Projects name are as below-"
echo "--------------------------"
ls

#qa side 
echo -e "\nEnter your qa project name"
read -p "project_path- " project_name
cd /home/user/repo/qa/$project_name

#update your qa repo using git command
echo -e "\nIf you want to update your qa repo using git pull (y or n)"
a=y
read -p "yes(y) or No(n)- " yes

if [ $yes = $a  ]; then

	echo " "
	echo "Enter git password"
	git pull
fi

touch build_upload
nano build_upload

echo -e "\n*** File changes ***"
cat build_upload | xargs tar -cvf build_upload.tar.gz
echo "----------------------------"

#live repo side
echo -e "\nGo to upload on live (y or n)"
a=y
read -p "yes(y) or No(n)- " yes

if [ $yes = $a  ]; then

		#live project path
		cd /home/user/repo/live
		echo " "
		echo "live Projects name are as below-"
		echo "--------------------------"
		ls

		echo -e "\nEnter your live project name"
		read -p "live_project_name- " live_project_name

		mv /home/user/repo/qa/$project_name/build_upload.tar.gz /home/user/repo/live/$live_project_name
		rm -f /home/user/repo/qa/$project_name/build_upload

		cd /home/user/repo/live/$live_project_name

		tar xvf build_upload.tar.gz
		rm -rf build_upload.tar.gz

		#git commit -a -m " "
		#git status && git push

		echo " "
		echo "----------------------------------------------------------------"
		echo -e "Congratulation you have successfully uploaded on live repo"
		echo "----------------------------------------------------------------"
		echo " "

else
		echo " "
		echo "--------------------"
		echo "Please try again"
		echo "--------------------"
		echo " "
		rm -f /home/user/repo/qa/$project_name/build_upload
		rm -rf /home/user/repo/qa/$project_name/build_upload.tar.gz
fi
