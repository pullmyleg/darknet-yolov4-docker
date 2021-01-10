# darknet-yolov4-docker

Raw ubuntu image with OpenCV and the latest AlexeyAB/darknet installed. Also includes yolov4-tiny weights and a horse testing video (takes a little while to find objects). 

## To use: 
1) install docker
2) run: docker pull pullmyleg/darknet
3) run: docker run -p 8070:8070 -p 8090:8090 --name darknet_pullmyleg -it pullmyleg/darknet
4) run: ./darknet detector demo cfg/coco.data cfg/yolov4-tiny.cfg yolov4-tiny.weights horse.mp4 -json_port 8070 -mjpeg_port 8090 -ext_output -dont_show 
5) open: http://localhost:8070/ on your local machine and see the detection output. Open http://localhost:8090/ to see the video stream.
6) For more information on commands that can be run within this container see: https://github.com/AlexeyAB/darknet#how-to-use-on-the-command-line 

## To build yourself from dockerfile: 

- Save dockerfile as dockerfile on local machine
- Navigate to this location in powershell, cmd, terminal etc.
- run: docker build -t darknet .
- run: to the fridge for a beer (openCV is slow)
- Run: docker run -p 8070:8070 -p 8090:8090 --name darknet -it darknet

Once the container is running. Open a bash command and run the following to test video detection and the JSON output: 
./darknet detector demo cfg/coco.data cfg/yolov4-tiny.cfg yolov4-tiny.weights horse.mp4 -json_port 8070 -mjpeg_port 8090 -ext_output -dont_show

You should be able to open: http://localhost:8070/ on your local machine and see the detection output. 
Open http://localhost:8090/ to see the video stream.

For more information on commands that can be run within this container see: https://github.com/AlexeyAB/darknet#how-to-use-on-the-command-line 
