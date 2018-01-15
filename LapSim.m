% Car Specifactions
    %Total Mass of Car in kg
    m = 150;
%Tire Radius in m
Rt = 0.35;
%Engine Torque
Et = 20;
%Gear Ratio
Gr = 7.5
%DriveTrain Effiency
Dte = 0.80;
%Tyre Friction Coefficient
Ctf = 0.8;
%Rolling Resistance Coefficient
Crr = 0.0001;
%Drag Coefficient
Cd = 1;
%Frontal Area of Car in m^2
Af = 1;
%Lift Coefficient
Cl = 0;

%Simulation Settings
    %Time Step Constant seconds
    dt=0.1;
    %Simulation Duration in Seconds
    SimTime = 100;

    dataPoints = SimTime/dt;
    
%Constants
    %Gravitational Constant
    g = 9.8;
    %Density of Air kg/m^3
    dAir = 1.225;
%Setup for the Simulation
    v=0;
    t = 0;
    i=1;
    
    MaxAcceleration = Ctf*g*m*0.5;

    Velocity = zeros(1, dataPoints)
    Time = 0:dt:(SimTime)
while ( t < SimTime)
    %resistive forces calculations
    %rolling resistance calculations
    Frr = -(m*g*Crr);
    %drag force Calulations
    Fdrag = -(0.5*dAir*(v^2)*Cd*Af);
    %engine orce calculations
    Fengine = ((Et*Gr)/Rt)*Dte;

    Ftotal = Fengine+Frr+Fdrag;

    %acceleration
    a = Ftotal/m;
    if(a > MaxAcceleration)
        a = MaxAcceleration;
    end
    %Time Step
    v = v+(dt*a);
    %Save the velocity at each time to an array
    Velocity(i) = v;

    %increment time and counter
    t = t+dt;
    i=i+1;

end

plot(Time,Velocity)
xlabel('Time in Seconds')
ylabel('Velocity in m/s')

 




