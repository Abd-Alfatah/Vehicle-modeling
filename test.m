data=load('em_data.mat');
power=data.maxT_P;
torque=data.maxT_T;
angularspeed=power./torque;
x=[0:0.0116:1.15];
xlabel('t')
ylabel('angualr speed w')
plot(angularspeed,'o')
hold on
xlabel('t')
ylabel('angualr speed x')
plot(x)
plot(power,'*')
