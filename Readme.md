This is a repository for the Universitas Pertamina's temperature control device.

The device:

<img src="https://github.com/auralius/up_temperature_control_device/blob/master/Screenshots/UPTCLab.jpg" width="300" height="400">

Features:
- Low cost.
- Open hardware and software, you can make your own.
- Excellent linearity at steady state condition when the temperature is below 120 degress of Celcius.
- Two heaters with two temperature sensors.
- Each heater can be heated to about 140 degrees of Celcius.
- The device is designed such that only the power resistors that become hot. The driving transistors barely get any hot.

What you can learn with this device?
- Perform mathematical modeling, starting with the basic Time-Delay-Time-Constant (TDTC) model.
- Analyze the effect of a time delay to a system.
- Linearize the time delay model.
- Understand how a constrained input-output signal contributes to the guarantedness of system stability (a bounded-input and bounded-ouput (BIBO) system).
- Develop and tune a constant gain feedback control.
- Develop and tune a PID control.
- Develop an on-off control with hysteresis.
- Develop more advance model based controls such as the Model Reference Adaptive Control (MRAC).
- Develop multiple-input and multiple-output (MIMO) models and controls.
- Perform system parameter optimizations.

The software that is used is MATLAB Simulink with the Arduino support package. It is also possible to use LabVIEW with Linx libraries for the Arduino.

Here some examples:

Pade approximation of a time delay model:

<img src="https://github.com/auralius/up_temperature_control_device/blob/master/Screenshots/implemented_P_control_side_by_side_with_Pade_model.png" width="790" height="400">

The TDTC model:

<img src="https://github.com/auralius/up_temperature_control_device/blob/master/Screenshots/TDTC_model_simulation.png" width="735" height="230">

The on-off control with hysteresis:

<img src="https://github.com/auralius/up_temperature_control_device/blob/master/Screenshots/on_off_control.png" width="670" height="300">

The MRAC with the MIT rule:

<img src="https://github.com/auralius/up_temperature_control_device/blob/master/Screenshots/mrac.png" width="780" height="350">


You might also want to look into the Arduino TCLab from Birgham Young University, where we mainly get our inspiration from: http://apmonitor.com/pdc/index.php/Main/ArduinoTemperatureControl

There is also one from RMIT, Australia: https://journals.sagepub.com/doi/10.1177/0020720919852784

