#include <stdio.h>
int main()
{
	char *str ="leve live love love";
	char *find ="love";
	char ch;
	int flag = 1000;
	int ls=0,lf=0;
	while((ch=str[ls])!='\0')
		ls++;
	while((ch=find[lf])!='\0')
		lf++;
	int i,n=0;
	for(i=0;i<ls-lf+1;i++)
	{
		int mi=0,j;
		for(j=0;j<lf;j++)
		{
				if(str[i+j]!=find[j])
				{
				mi++;
				}
		}
		if(mi <= flag)
		{
			n++;
		}
	}
	printf("%d\n",n);
	return 0;
}