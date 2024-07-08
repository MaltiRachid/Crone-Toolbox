%% Function-based unit test for frac_fpe_simplify
% Last revision 14/09/2021

function tests = test_fpe_simplify
    tests = functiontests(localfunctions);
end

function testSimplifySISO(testCase)
    pol=frac_poly_exp([1 2 0 3 -1],[3 2 1 0 2]);
    spol=simplify(pol);
    pol_exp=frac_poly_exp([1 1 3],[3 2 0]);
    
    assertEqual(testCase,spol,pol_exp,'spol is not pol_exp');
end
function testSimplify0(testCase)
    pol=frac_poly_exp([0 0 0 0 0],[3 2 1 0 2]);
    spol=simplify(pol);
    
    assertEqual(testCase,spol,frac_poly_exp(0),'spol is not frac_poly_exp(0,1)');
end

function testSimplify00(testCase)
    pol=frac_poly_exp({[0 0 0 0 0] [0 0 0 0 0];[0 0 0 0 0] [0 0 0 0 0]},{[3 2 1 0 2] [3 2 1 0 2];[3 2 1 0 2] [3 2 1 0 2]});
    spol=simplify(pol);
    
    assertEqual(testCase,spol,[frac_poly_exp(0) frac_poly_exp(0);frac_poly_exp(0) frac_poly_exp(0)],'spol is not frac_poly_exp(0,1)');
end

function testSimplifyMIMO(testCase)
    pol1 = frac_poly_exp([1 2 0],[0.5  0.1 3]);
    pol2 = frac_poly_exp([1 2 0 3 -1],[3 2 1 0 2]);
    Pol = [pol1, pol2; pol2, pol1];
    spol=simplify(Pol);
    pol1_exp=frac_poly_exp([1 2],[0.5 0.1]);
    pol2_exp=frac_poly_exp([1 1 3],[3 2 0]);
    Pol_exp = [pol1_exp, pol2_exp; pol2_exp, pol1_exp];
    
%     % Cette boucle traite le cas MIMO de simplify à la place de multi()
%     [n,m]=size(Pol);
%     for i=1:n
%         for j=1:m
%             polin=Pol(i,j);
%             polout(i,j)=simplify(polin);
%         end
%     end
%     % Elle fonctionne qu'en dehors de simplify.
%     assertEqual(testCase,polout,Pol_exp,'polout is not pol_exp');

    assertEqual(testCase,spol,Pol_exp,'spol is not pol_exp');
end

function testMatchSameOrder(testCase)
    % The polynomial is given with the folowing order :
    %   s^6 + 2 s^0.2 + 3 s^6 + 2 s^3 - s^0.2 
    P=frac_poly_exp([1 2 3 2 -1],[6 0.2 6 3 0.2]);
    Q = simplify(P);
    assertEqual(testCase,Q,frac_poly_exp([4 2 1],[6 3 0.2]),'Q is not 4s^6+2s^3+s^0.2');
end