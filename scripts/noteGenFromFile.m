input = fopen("Standard Note Frequencies.txt");
freq = fgetl(input);
while (freq > 0)
	noteGen(str2double(freq));
	freq = fgetl(input);
end
