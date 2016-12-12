function [ H,S,V ]=rgb2hsv2(P) % Algoritmul de conversie din enuntul temei
	P=double(P)/255;	%Vectorizat pentru a fi folosit pe matrici
	R2=P(:,:,1);
	G2=P(:,:,2);
	B2=P(:,:,3);
	Cmax=max(P,[],3);
	Cmin=min(P,[],3);
	delta=Cmax-Cmin;
	H=zeros(size(R2));
	S=zeros(size(G2));
	V=zeros(size(B2));
	tes=(delta==0);
	H(tes)=0;
	
	tes=(Cmax==R2 & delta!=0 & H(:,:)==0);
	H(tes)=60*mod(((G2(tes).-B2(tes))./delta(tes)),6);
	
	tes=(Cmax==G2 & delta!=0 & H(:,:)==0);
	H(tes)=60*((B2(tes).-R2(tes))./delta(tes)+2);
	
	tes=(Cmax==B2 & delta!=0 & H(:,:)==0);
	H(tes)=60*((R2(tes).-G2(tes))./delta(tes)+4);
	
	H=double(H)/360;
	tes=(Cmax==0);
	S(tes)=0;
	tes=(Cmax!=0);
	S(tes)=double(delta(tes))./Cmax(tes);
	V=Cmax;
end
