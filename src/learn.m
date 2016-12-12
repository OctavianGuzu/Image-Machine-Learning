function w=learn(X,t)
	n=length(X);
	b=ones(n,1);
	X=[X b];
	%Rezolvare sistemului folosind descompunere QR si SST
	[Q R]=gssm(X);
	a=Q'*t;
	w=SST(R,a);
end
