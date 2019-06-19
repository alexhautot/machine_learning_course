xpos = [];
xneg = [];
m=length(x);
%a=0;
%b=0;


for i =  1:(m),
	if y(i) == 1,
		%a++;
		a=x(i,:);
		xpos = [xpos;a];
	else
		%b++;
		a=x(i,:);
		xneg = [xneg;a];
	end
	i ++;
end 
figure; hold on;
plot(xpos, 'k+')
plot(xneg, 'go')


