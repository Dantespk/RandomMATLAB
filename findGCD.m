%This program will use Euclid's algorithm to find the gcd and an x and y  
%such that the linear combination will equal the gcd. It will print each 
%step so the user may follow the pattern
%9/10/2018
%CC by SA (Creative Commons Attribution ShareAlike)

function gcd = findGCD(a,b)
    if a < b
        A = b;
        B = a;
    elseif a > b 
        A = a;
        B = b;
    elseif a == b  
        gcd = a;
        return
    end
    r = 1;
    index = 0;
    big = [];
    mult = [];
    multBig = [];
    while r ~= 0
        r = mod(A,B);
        
        breakDown = strcat(int2str(A),' =',{' '},int2str((A-r)/B),' *',{' '},int2str(B),' +',{' '}, int2str(r));
        disp(breakDown)
        big = [big A];
        mult = [mult (A-r)/B];
        multBig = [multBig B];
        A = B;
        B = r;
        index = index +1;
    end
    answer = strcat('gcd is ',{' '},int2str(A));
    disp(answer)
    big;
    mult;
    multBig;
    if index > 1
        firstStatement = strcat(int2str(A),' =',{' '},int2str(big(index-1)),' -',{' '},int2str(mult(index-1)),' *',{' '},int2str(multBig(index-1)));
        disp(firstStatement)
        index = index-1;
        anothermult = 1;
        anothermult2 = mult(index);
        while index ~= 1
            index = index -1;
            statement1 = strcat('  =',{' '},int2str(anothermult),' *',{' '},int2str(big(index+1)),' -',int2str(anothermult2),{'('},int2str(big(index)),' -',{' '},int2str(mult(index)), ' *',{' '},int2str(multBig(index)),')');
            disp(statement1)
            
            anothermult = anothermult2 * mult(index) + anothermult; 
            statement2 = strcat('  =',{' '},int2str(anothermult),' *',{' '},int2str(big(index+1)),' -',int2str(anothermult2),' *',{' '},int2str(big(index)));
            disp(statement2)
            
            index = index -1;
            if index < 1
                return
            end
            
            statement3 = strcat('  =',{' '},int2str(anothermult),'(',int2str(big(index)),' -',{' '}, int2str(mult(index)),' *',{' '},int2str(multBig(index)),') -',{' '},int2str(anothermult2),' *',{' '},int2str(multBig(index))); 
            disp(statement3)
            
            
            anothermult2 = mult(index) * anothermult + anothermult2;
            statement4 = strcat('  =',{' '},int2str(anothermult),' *',{' '},int2str(big(index)),' -',int2str(anothermult2),' *',{' '},int2str(multBig(index)));
            disp(statement4);
            
        end
    end
        
    
end