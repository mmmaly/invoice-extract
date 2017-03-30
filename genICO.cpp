#include<stdio.h>


int main()
{
	for(int i=0;i<=9999999;i++)
	{
		int sum=0;
		int pow10=1;
		for(int p=0;p<7;p++)
		{
			pow10*=10;
			int digit=i%pow10/(pow10/10);
			sum+=digit*(p+2);	
//			printf("%d digit is %d, %d*%d=%d\t%d\n",p,digit,digit,p+2,digit*(p+2),sum);
		}
		int checksum=(11-sum%11)%10;
		
		printf("%07d%1d\n",i,checksum);
	}

}
