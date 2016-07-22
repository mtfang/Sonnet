boxX = 1500;
boxY = 1500;
air = 500:500:5000;
cap = [];
for i = 1:length(air)
    cap(i) = RectangleFunctionAir([2, 2], [200,200], [boxX, boxY], air(i));
end
figure(1);
plot(air, cap);
