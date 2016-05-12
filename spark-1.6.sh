cd /tmp
wget http://d3kbcqa49mib13.cloudfront.net/spark-1.6.1-bin-cdh4.tgz
tar zxf spark-1.6.1-bin-cdh4.tgz -C /usr/local/

cd /usr/local/spark-1.6.1-bin-cdh4/conf
cp spark-defaults.conf.template spark-defaults.conf
cp spark-env.sh.template spark-env.sh

cat <<EOF > /etc/rc.local
#!/bin/sh -e
export SPARK_MASTER_IP=127.0.0.1
cd /usr/local/spark-1.6.1-bin-cdh4
sbin/start-master.sh
sbin/start-slave.sh -m 512M spark://localhost:7077

exit 0
EOF

cd /home/demo/Desktop
cat <<EOF > spark-master.desktop
[Desktop Entry]
Encoding=UTF-8
Name=Spark Master
Type=Link
URL=http://localhost:8080/
Icon=text-html
EOF

cat <<EOF > start-tutorial.desktop
[Desktop Entry]
Version=1.0
Name=Open OSCON Tutorials
Terminal=true
Type=Application
Categories=Utility;Application;
Exec=/home/demo/Desktop/spark-training/start.sh
EOF

chmod 755 start-tutorial.desktop
chown demo:demo start-tutorial.desktop

chmod 644 spark-master.desktop

# movielens
apt-get install -y python-pip python-dev git
pip install cassandra-dataset-manager
cdm install movielens-small
nodetool flush

# download the tutorial
git clone https://github.com/rustyrazorblade/spark-training.git
chown -R demo:demo spark*
cd spark-training
pip install jupyter
pip install -r requirements.txt

mv /tmp/spark-cassandra-connector-assembly-1.6.0-M2.jar .

cat <<EOF > start.sh
#!/bin/bash
CONNECTOR=spark-cassandra-connector-assembly-1.6.0-M2.jar

cd /home/demo/Desktop/spark-training
export PYSPARK_DRIVER_PYTHON=ipython PYSPARK_DRIVER_PYTHON_OPTS="notebook"

/usr/local/spark-1.6.1-bin-cdh4/bin/pyspark \
 --jars \$CONNECTOR \
 --driver-class-path \$CONNECTOR \
 --conf spark.cassandra.connection.host=127.0.0.1 \
 --master spark://127.0.0.1:7077

EOF

chmod 755 start.sh
chown demo start.sh
