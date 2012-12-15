function [ xprime,gradxprime ] = computeXprime( c1,gradc1,c2,gradc2,Rprime,gradRprime,l1,gradl1,l2,gradl2,...
                                          P,sigma,psi,beta,s_,u2btild)
%COMPUTEXPRIME %Computes the choice of the state variable xprime tomorrow in the
%standard 3x2 format as well as gradient with respect to z (note this
%is unfortunated notation, xprime is refering to u2btildprime
%($u_{c,2}\tilde b'$), while x is the vector [c_1(1), c_1(2), c_2(1)]).
    

    %First create c2 alt.  Here c2alt is a matrix of the fomr
    %   c_2(2)  c_2(1)
    %   c_2(2)  c_2(1)
    %   c_2(2)  c_2(1)
    %This is so when we have multiplications like c2.*c2alt we get
    %   c_2(2)c_2(1) c_2(1)c_2(2)
    %   c_2(2)c_2(1) c_2(1)c_2(2)
    %   c_2(2)c_2(1) c_2(1)c_2(2)
    c2alt = fliplr(c2);
    gradc2alt = fliplr(gradc2);
    %Now the expected marginal utility of agent 2.  Again want it in 3x2
    %format
    Euc2 = kron(ones(1,2),psi*c2.^(-sigma)*(P(s_,:)'));
    
    %create new 3x2 P and Palt
    P = kron(ones(3,1),P(s_,:));
    Palt = fliplr(P);
    
    %Now compute xprime from formula in notes
    xprime = u2btild*psi*c2.^(-sigma)./(beta*Euc2) + (1-psi)*l2./(1-l2)...
             -(1-psi)*Rprime.*l1./(1-l1)+psi*c1.*c2.^(-sigma)-psi*c2.^(1-sigma);
    %Now compute the gradient
    gradxprime = ( -sigma*u2btild*psi*c2.^(-sigma-1)./(beta*Euc2)...
                    + (sigma*u2btild*psi^2*c2.^(-2*sigma-1).*P.*beta)./((beta*Euc2).^2)...
                   -sigma*psi*c2.^(-sigma-1).*c1-(1-sigma)*psi*c2.^(-sigma)).*gradc2...
                +(sigma*u2btild*psi^2*c2.^(-sigma).*c2alt.^(-sigma-1)*beta.*Palt)...
                 ./((beta*Euc2).^2).*gradc2alt+psi*c2.^(-sigma).*gradc1...
                +(1-psi)*gradl2./((1-l2).^2)-(1-psi)*Rprime.*gradl1./((1-l1).^2)...
                -(1-psi)*l1.*gradRprime./(1-l1);
end

