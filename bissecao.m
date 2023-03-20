function [r, iter] = bissecao(A, P, m, a, b, tol)
  fa = A - P*((a*(1+a)^m) / (((1+a)^m)-1));
  fb = A - P*((b*(1+b)^m) / (((1+b)^m)-1));
  iter = 0;
  while (b-a)/2 > tol
    c = (a+b)/2;
    fc = A - P*((c*(1+c)^m) / (((1+c)^m)-1));
    if (fc == 0)
      break;
    endif
    if (sign(fc) == sign(fa))
      a = c;
      fa = fc;
    else
      b = c;
      fb = fc;
    endif
    iter = iter+1;
  endwhile
  r = (a+b)/2;
endfunction
