% noteGen
% Function to generate a wave file of the given frequency
%
% function noteGen(f)
%
% Inputs:
% 	f: The frequency that needs to be mapped to a note
%

function noteGen(f)
	% Some default settings
	BitsPerSample = 16;
	SamplesPerSecond = 8000;
	TotalLength = 2;
	SamplesFaded = 1000;

	n = 0;
	if (f > 0)
		% Assign name to frequency
		notes = {'C','C#_Db','D','D#_Eb','E','F','F#_Gb','G','G#_Ab','A','A#_Bb','B'};
		steps = log(f/440)/log(2^(1/12));
		steps = round(steps) + 10;
		n = mod(steps,12);
		if (n == 0) n = 12; end
		n = notes{n};
		steps = ceil(steps/12);
		n = strcat(n,num2str(3 + steps));

		% Generate tone
		samples = SamplesPerSecond * TotalLength;
		wave = sin(linspace(0,TotalLength,samples)*2*pi*f)';
		% Fade in and fade out by number of specified samples
		window = [linspace(0,1,SamplesFaded),ones(1,samples-2*SamplesFaded),linspace(1,0,SamplesFaded)]';
		wavwrite(wave.*window,SamplesPerSecond,BitsPerSample,strcat(n,'.wav'));
	end
end
