function [  V ]=hsvHistogram(A,count_bins)
	P=imread(A);
	%conversia RGB 2 HSV
	[H,S,V]=rgb2hsv2(P);
	l=1.01/count_bins;
	aH=zeros(1,count_bins);
	aS=zeros(1,count_bins);
	aV=zeros(1,count_bins);
	%obtinerea vectorului de count_bins elemente
	for i=0:count_bins-1
		aH(i+1)=sum((H >=i*l & H < (i+1)*l)(:));
		aS(i+1)=sum((S >=i*l & S <(i+1)*l)(:));
		aV(i+1)=sum((V >=i*l & V <(i+1)*l)(:));
	end
	V=[aH aS aV];
	
end
