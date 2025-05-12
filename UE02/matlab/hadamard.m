% (b): compute H_16
%starting matrix
H_1 = (1);

%compute the Hadamard-matrix H_16
H_2 = hadamard2n(H_1);
H_4 = hadamard2n(H_2);
H_8 = hadamard2n(H_4);
H_16 = hadamard2n(H_8)

%(c): test orthogonality:
res2_3 = H_16(2,:)*H_16(3,:)';
res3_4 = H_16(3,:)*H_16(4,:)';

disp(['Zweite und dritte Zeile von H_16: ', num2str(res2_3)]);
disp(['Dritte und vierte Zeile von H_16: ', num2str(res3_4)]);

% (a): Write the hadamard function
function H_2n = hadamard2n(H_n)
    H_2n = [H_n, H_n; H_n, -H_n];
end
