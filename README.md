# CORDIC_algo
* We won't go too far to math behind this algorithm. But in general by using binary search we can find an angle input. Each time searching for the angle, we reduce the value +/- by half. In circuit design, it is equivalent to successive approximation algorithm.
![image](https://user-images.githubusercontent.com/57820377/144734930-9e61bfe0-3f07-48f4-a232-92a5f9063257.png)
- If we set y0 = 0 then 
   + xk = G*x0*cosz0
   + yk= G*x0*sinz0
   + zk+1=-dk*tan-1(2-k)
- Then set x0 = 1/G, we finally get:
  + xk = cosz0
  + yk= sinz0
  + zk+1=-dk*tan-1(2-k) 
dk = sign(zk) = -1 if zk < 0 and 1 if zk >=0
- For 2 inputs x0, y0, we set x0 = 1/G, y0 = 0. For input z0 we set z0 as angle we want to calculate. 
- Output xk, yk are cos and sin of the angle. 
- If we property set tan-1(2-k) in LUT, tan of z0 is calculatable. 

