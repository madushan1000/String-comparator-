#include <stdio.h>
#include <stdlib.h>
int comp(char *str,char *find,int flag);
int main()
{
	char *str = "love love no a love lave live lovf thus a olive abc 123 ikman love";
	//char *str = "love love love";
	char *find = "love";
	
	int flag=1;
	printf("%d \n",comp(str,find,flag));
	return 0;
}

int comp(char *str,char *find,int flag)
{
	int lens = 0,lenf = 0,i,j,n=0,count=0;
	char ch;
	while((ch=str[lens]) != '\0')
		lens++;
	while((ch=find[lenf]) != '\0')
		lenf++;

	for(i=0;i<=lens;i++)
	{
		if(str[i]==' ' || str[i] =='\0')
		{
			//printf("a");
			for(j=1;j<=lenf;j++)
			{
				//printf("%c ",str[i-j]);
				if( i-j>=0 && str[i-j] !=' ')
				{
					//printf("%c %c\n",str[i-j],find[lenf-j]);
					if(str[i-j] == find[lenf-j])
						n++;
				}
				else
					break;
			}
			if(n>=lenf-flag)
			{
				count++;
			}
			n=0;
		}
	}
	return count; 
}
