function [ V ]=rgbHistogram(A,count_bins)
	P=imread(A);
	R=P(:,:,1);
	G=P(:,:,2);
	B=P(:,:,3);
	l=256/count_bins;
	iR=floor(double(R)./l);
	iG=floor(double(G)./l);
	iB=floor(double(B)./l);
	aR=zeros(1,count_bins);
	aG=zeros(1,count_bins);
	aB=zeros(1,count_bins);
	%Impartirea in intervale si obtinerea vectorului de count_bins elemente
	for i=1:count_bins
		aR(i)=sum((iR==(i-1))(:));
		aG(i)=sum((iG==(i-1))(:));
		aB(i)=sum((iB==(i-1))(:));
	end
	V=zeros(1,3*count_bins);
	V=[ aR aG aB];
end
