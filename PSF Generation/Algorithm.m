% Coordinates of object point(x0, y0, z0);
x0 = 0;
y0 = 0;
z0 = 0;
% coordinates of virtual exit pupil z', 
x1 = 1;
y1 = 1;
z1 = 1;

% coordinates of image plane z'',
x2 = 5;
y2 = 7;
z2 = 8;

% sample range on virtual exit pupil x'*y',
x_r1 = 1;
y_r1 = 2;

% sample interval of virtual exit pupil t',
t1 = 10;

% sample range on image plane
x_r2 = 3;
y_r2 = 4;

% sample interval of sampling range at the image plane
t2 = 1;

%normal unit vector of virtual exit pupil n
n = [1, 0, 0];

lamda = 450;



% 1. Generate an ceil(x''/t'')*ceil(y''/t'') PSF matrix I_x''y''
I_x2y2 = zeros(ceil(x_r2/t2), ceil(y_r2/t2));

% 2. Generate an ceil(x''/t'')*ceil(y''/t'') complex amplitutde matrix E~x''y''
E_x2y2 = zeros(ceil(x_r2/t2), ceil(y_r2/t2));

% 3. Compute the intersection (x_c2, y_c2, z_intersect) of the main ray and the
% Define the values

X = 1;
Y = 0;
Z = 0;
c = 2;

% Call the function to compute the intersection point
[x_c2, y_c2, z_intersect] = intersection(x0, y0, z0, X, Y, Z, c);


%4. Initializing E_sum
    E_sum = 0+0i

    for x2 = x_c2-(x_r2/2):t1:x_c2+(x_r2/2)

        for y2 = y_c2-(y_r2/2):t2:y_c2+(y_r2/2)

            for x1 = -x_r1/2:t1:x_r1/2

                for y1 = -y_r1/2:t1:y_r1/2

                    % solve for optical path length
                    I_x1y1 = sqrt((x1-x0)^2+(y1-y0)^2+(z1-z0)^2);
                
                    % solve for Directional vector D
                    D = VectorD(X, Y, Z);
                    disp(D); % Display the normalized direction vector

                    r_x2y2=[x2-x1, y2-y1, z2-z1];
                    
                    a_0 = 1;
                    %Call functions to Compute E-IrK
                    E_IrK = ComputeE_Irk(a_0, I_x1y1, r_x2y2, D, n, lamda);

                    E_sum = E_sum + E_IrK;
                      
                end
            end

                E_x2y2=E_sum;
                E_sum=0+0i;

        end
   end


   I_x2y2 = E_x2y2*conj(E_x2y2);
   disp(I_x2y2)
                 


      