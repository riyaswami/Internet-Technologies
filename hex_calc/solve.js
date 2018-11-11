var exp="";
            function func_0()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'0';
                document.getElementById("exp").value=exp;
            }
            function func_1()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'1';
               
                document.getElementById("exp").value=exp;
            }
            function func_2()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'2';
                document.getElementById("exp").value=exp;
            }
            function func_3()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'3';
                document.getElementById("exp").value=exp;
            }
            function func_4()
            {   var temp=document.getElementById("exp").value;
                exp=temp+'4';
                document.getElementById("exp").value=exp;
            }
            function func_5()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'5';
                document.getElementById("exp").value=exp;
            }
            function func_6()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'6';
                document.getElementById("exp").value=exp;
            }
            function func_7()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'7';
                document.getElementById("exp").value=exp;
            }
            function func_8()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'8';
                document.getElementById("exp").value=exp;
            }
            function func_9()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'9';
                document.getElementById("exp").value=exp;
            }
            
            function func_A()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'A';
                document.getElementById("exp").value=exp;
            }
            
            function func_B()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'B';
                document.getElementById("exp").value=exp;
            }
            function func_C()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'C';
                document.getElementById("exp").value=exp;
            }
            function func_D()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'D';
                document.getElementById("exp").value=exp;
            }
            function func_E()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'E';
                document.getElementById("exp").value=exp;
            }
            function func_F()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'F';
                document.getElementById("exp").value=exp;
            }
            function func_p()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'+';
                document.getElementById("exp").value=exp;
            }
            function func_s()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'-';
                document.getElementById("exp").value=exp;
            }
            function func_m()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'*';
                document.getElementById("exp").value=exp;
            }
            function func_div()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'/';
                document.getElementById("exp").value=exp;
            }
            function func_and()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'&';
                document.getElementById("exp").value=exp;
            }
            function func_or()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'|';
                document.getElementById("exp").value=exp;
            }
            function func_not()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'~';
                document.getElementById("exp").value=exp;
            }
            function func_xor()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'^';
                document.getElementById("exp").value=exp;
            }
            function func_clr()
            {
                var temp=document.getElementById("exp").value;
                exp=temp.slice(0,temp.length-1);
                document.getElementById("exp").value=exp;
            }
            function func_ac()
            {
                exp='';
                document.getElementById("exp").value=exp;
            }
            function func_sign()
            {
                var temp=document.getElementById("exp").value;
                exp=temp+'-';
                document.getElementById("exp").value=exp;
            }
            function func_eq()
            {
                var temp=document.getElementById("exp").value;
                var res= solve(temp);
                document.getElementById("exp").value=res;
                
            }
            function solve(exp)
            {
                var input_array;
                if(exp.includes('*'))
                {      
                    input_array=exp.split('*');
                    var a =parseInt(input_array[0],16);
                 //   alert('a'+a);
                    var b= parseInt(input_array[1],16);
                 //   alert('b'+b);
                    var res= a*b;
                //    alert(parseInt(res, 10).toString(16));
                    return parseInt(res, 10).toString(16);
                }
                
                if(exp.includes('^'))
                {      
                    input_array=exp.split('^');
                    var a =parseInt(input_array[0],16);
                    var b= parseInt(input_array[1],16);
                    var res= a^b;
                    return parseInt(res, 10).toString(16);
                }
                if(exp.includes('/'))
                {      
                    input_array=exp.split('/');
                    var a =parseInt(input_array[0],16);
                    var b= parseInt(input_array[1],16);
                    var res= a/b;
                    return parseInt(res, 10).toString(16);
                }
                if(exp.includes('+'))
                {      
                    input_array=exp.split('+');
                    var a =parseInt(input_array[0],16);
                    var b= parseInt(input_array[1],16);
                    var res= a+b;
                    return parseInt(res, 10).toString(16);
                }
                if(exp.includes('-'))
                {      
                    input_array=exp.split('-');
                    var a =parseInt(input_array[0],16);
                    var b= parseInt(input_array[1],16);
                    var res= a-b;
                    return parseInt(res, 10).toString(16);
                }
                if(exp.includes('~'))
                {      
                    input_array=exp.split('~');
                    var a =parseInt(input_array[1],16);
                    var res= ~ a;
                    return parseInt(res, 10).toString(16);
                }
                if(exp.includes('&'))
                {      
                    input_array=exp.split('&');
                    
                    var a =parseInt(input_array[0],16);
                    var b= parseInt(input_array[1],16);
                    var res= a & b;
                    return parseInt(res, 10).toString(16);
                }
                if(exp.includes('|'))
                {      
                    input_array=exp.split('|');
                    var a =parseInt(input_array[0],16);
                    var b= parseInt(input_array[1],16);
                    var res= a | b;
                    return parseInt(res, 10).toString(16);
                }
            }