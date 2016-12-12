function [ X,t ]=preprocess(A,string,nr)
	%obtinerea imaginilor
	B=strcat(A,'cats/');
	imgs=getImgNames(B);
	B=strcat(A,'not_cats/');
	imgs2=getImgNames(B);
	lungime=length(imgs)+length(imgs2);
	X=zeros(lungime,3*nr);
	t=zeros(1,lungime);
	%daca se foloseste RGB
	if strcmp(string,'RGB')==1
		%imaginile din cats
		for i=1:length(imgs)
			B=strcat(A,'cats/');
			B=strcat(B,imgs(i,:));
			X(i,:)=rgbHistogram(B,nr);
			t(i)=1;
		end
		%imaginile din not_cats
		for i=length(imgs)+1:lungime
			B=strcat(A,'not_cats/');
			B=strcat(B,imgs2(i-length(imgs),:));
			X(i,:)=rgbHistogram(B,nr);
			t(i)=-1;
		end
	else
	%daca se foloseste HSV
		for i=1:length(imgs)
			B=strcat(A,'cats/');
			B=strcat(B,imgs(i,:));
			X(i,:)=hsvHistogram(B,nr);
			t(i)=1;
		end
		for i=length(imgs)+1:lungime
			B=strcat(A,'not_cats/');
			B=strcat(B,imgs2(i-length(imgs),:));
			X(i,:)=hsvHistogram(B,nr);
			t(i)=-1;
		end
	end
	t=t';
end
	
		
