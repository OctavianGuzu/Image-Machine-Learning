function p=evaluate(A,w,string,nr)
	%numele imaginilor
	B=strcat(A,'cats/');
	imgs=getImgNames(B);
	B=strcat(A,'not_cats/');
	imgs2=getImgNames(B);
	lungime=length(imgs)+length(imgs2);
	X=zeros(lungime,3*nr);
	%daca se foloseste RGB
	if strcmp(string,'RGB')==1
		s=0;
		%pozele din cats
		for i=1:length(imgs)
			B=strcat(A,'cats/');
			B=strcat(B,imgs(i,:));
			X(i,:)=rgbHistogram(B,nr);
			r=X(i,:);
			r=[r 1];
			y=w'*(r)';
			%daca a ghicit corect
			if y>=0
				s=s+1;
			end
		end
		%pozele din not_cats
		for i=length(imgs)+1:lungime
			B=strcat(A,'not_cats/');
			B=strcat(B,imgs2(i-length(imgs),:));
			X(i,:)=rgbHistogram(B,nr);
			r=X(i,:);
			r=[r 1];
			y=w'*(r)';
			%daca a ghicit corect
			if y<=0
				s=s+1;
			end
		end
	else
	%daca se foloseste HSV
		s=0;
		for i=1:length(imgs)
			B=strcat(A,'cats/');
			B=strcat(B,imgs(i,:));
			X(i,:)=hsvHistogram(B,nr);
			r=X(i,:);
			r=[r 1];
			y=w'*(r)';
			if y>=0
				s=s+1;
			end
		end
		for i=length(imgs)+1:lungime
			B=strcat(A,'not_cats/');
			B=strcat(B,imgs2(i-length(imgs),:));
			X(i,:)=hsvHistogram(B,nr);
			r=X(i,:);
			r=[r 1];
			y=w'*(r)';
			if y<=0
				s=s+1;
			end
		end
	end
	p=double(s)/lungime*100;
end
