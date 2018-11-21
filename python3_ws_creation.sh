# Setup ~/python3_ws
cd
source /opt/ros/kinetic/setup.bash
mkdir -p ~/python3_ws/src
cd ~/python3_ws/
catkin_make

cd ~/python3_ws/src
git clone https://github.com/openai/baselines.git
cd baselines
virtualenv venv --python=python3
rm -rf .git

source venv/bin/activate

pip install tensorflow
pip install -e .
pip install pyyaml rospkg catkin_pkg exception defusedxml mpi4py

cd ~/python3_ws/src; cd baselines
source venv/bin/activate

pip install catkin_pkg pyyaml empy rospkg numpy
cd ~/python3_ws/src
git clone https://github.com/ros/geometry
git clone https://github.com/ros/geometry2
git clone https://bitbucket.org/theconstructcore/openai_ros.git
git clone https://bitbucket.org/theconstructcore/theconstruct_msgs.git
rm -rf geometry/.git
rm -rf geometry2/.git
rm -rf openai_ros/.git
rm -rf theconstruct_msgs/.git

cd ~/python3_ws/src
git init
git remote add origin https://github.com/ClimbsRocks/learning_backup.git
mv CMakeLists.txt CMakeLists.txt_backup
git pull origin master

git config --global user.email "ClimbsBytes@gmail.com"
git config --global user.name "ClimbsRocks"

cd ~/python3_ws
rm -rf build devel
catkin_make --force-cmake
source devel/setup.bash

rosrun gazebo_ros spawn_model -file ~/python3_ws/src/cube.urdf -urdf -x 1 -model my_object
rosrun gazebo_ros spawn_model -database demo_cube -gazebo -model grasp_cube -x 0.70 -y 0 -z 0.35

# To activate venv and the right bash:
cd ~/python3_ws/src/baselines
source venv/bin/activate
cd ~/python3_ws
source devel/setup.bash



# In separate tab, run this to set up ~/p2_ws
cd
source /opt/ros/kinetic/setup.bash
mkdir -p ~/p2_ws/src
cd ~/p2_ws/
catkin_make

cd ~/p2_ws/src

pip install tensorflow
pip install pyyaml rospkg catkin_pkg defusedxml mpi4py

pip install catkin_pkg pyyaml empy rospkg numpy
cd ~/p2_ws/src
git clone https://github.com/ros/geometry
git clone https://github.com/ros/geometry2
rm -rf geometry/.git
rm -rf geometry2/.git
cp -R ~/python3_ws/src/fetch_train ./
cp -R ~/python3_ws/src/fetch_moveit_config ./


cd ~/p2_ws
rm -rf build devel
catkin_make --force-cmake
source devel/setup.bash

roslaunch fetch_moveit_config execute_trajectory_service.launch











# cd ~/python3_ws
# git clone https://github.com/ClimbsRocks/learning_backup.git
# mv src/* learning_backup/
# rm -rf src
# mkdir src
# mv learning_backup/* src

# git --config user.name "ClimbsRocks"
# git --config user.email "ClimbsBytes@gmail.com"



# catkin_create_pkg my_moving_cube_pkg openai_ros rospy

# cd ~/python3_ws/src/my_moving_cube_pkg
# mkdir launch
# touch launch/my_start_training_deepq_version.launch
# chmod +x launch/my_start_training_deepq_version

# mkdir src
# touch src/my_start_deepq.py
# chmod +x src/my_start_deepq.py
# touch src/my_cube_single_disk_env.py
# touch src/my_one_disk_walk.py
# chmod +x src/my_cube_single_disk_env.py
# chmod +x src/my_one_disk_walk.py

# mkdir config
# touch config/my_one_disk_walk_openai_params_deepQ.yaml
# chmod +x config/my_one_disk_walk_openai_params_deepQ.yaml





# rosrun gazebo_ros spawn_model -file ./cube.urdf -urdf -x 1 -model my_object
# rosrun gazebo_ros spawn_model -database demo_cube -gazebo -model grasp_cube -x 0.70 -y 0 -z 0.35







