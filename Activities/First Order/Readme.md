logged_data.bin is the logged data from real experiment. It is a binary file, taken with the provided LabVIEW program. The logged file has 3 rows of data. Each row represents time, input, and output, repectively. The column itself represents the time point. The data was collected at 100Hz of sampling rate.

The main file is: optimized_tdtc.m

Run the main file to get what is really happening. 

For example, the optimization gives:
xf = [1.09633931848365   232.060134197884   9.49364907247007]; 

The first one is the steady state gain (Kss), the second one is the time constant (Tau), and the last one is the time delay (theta). Thus, the otimized model is:

``
T(s)/U(s) = Kss/(Tau*s+1)*exp(-s*theta) = 1.096/(232.060*s+1)*exp(-s*9.494)
``

![alt text](https://github.com/auralius/up_temperature_control_device/blob/master/Activities/First%20Order/demo1.png?raw=true)

![alt text](https://github.com/auralius/up_temperature_control_device/blob/master/Activities/First%20Order/demo2.png?raw=true)
