using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp1
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(solution(5,12)); 
        }

        public static int solution(int N, int number)
        {
            int answer = 0;
            int compare = 0;
            string sNum = N.ToString();

            //가장 큰 폭으로 증가하는 문자열 더하기 부터 계산
            do
                compare = compare == 0 ? compare + int.Parse(sNum + sNum) : int.Parse(compare + sNum);
            while (compare <= number);

            compare = int.Parse(compare.ToString().Substring(1));
            answer += compare.ToString().Length;
            if (compare == number) return answer;

            sNum = N.ToString();
            //문자열 더하기, 나누기 합침
            do
            {
                sNum += N.ToString();
            }
            while (int.Parse(sNum) <= number);

            answer = sNum.Length;

            if (int.Parse(sNum) / N <= number)
            {
                compare = int.Parse(sNum) / N;
                if (compare == number) return ++answer;
            }

            compare = int.Parse(compare.ToString().Substring(1));
            answer = compare.ToString().Length;
            if (compare == number) return answer;


            //다음 큰 폭으로 증가하는 곱하기 계산
            do
            {
                compare *= N;
                answer++;
            }
            while (compare <= number);
            if (compare == number && answer <= 8) return answer;
            else if (answer > 8) return -1;
            answer--;
            compare /= N;

            //다음 큰 폭으로 증가하는 더하기 계산
            do
            {
                compare += N;
                answer++;
            }
            while (compare <= number);
            if (compare == number && answer <= 8) return answer;
            else if (answer > 8) return -1;
            answer--;
            compare -= N;

            // 마지막 1씩 더하기 위해 나누기 계산
            do
            {
                compare++;
                answer++;
            } while (compare != number);
            if (compare == number && answer <= 8) return answer;
            else return -1;
        }

    }
}
