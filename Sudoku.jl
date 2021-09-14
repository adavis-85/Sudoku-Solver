n=Model(GLPK.Optimizer)

@variable(n,v[1:9,1:9])
@variable(n,x[1:9,1:9,1:9],binary=true)

@constraint(n,[i in 1:9,j in 1:9],sum(x[i,j,t] for t in 1:9)<=1)
@constraint(n,[i in 1:9,j in 1:9],v[i,j]==sum(t*x[i,j,t] for t in 1:9))
@constraint(n,[i in 1:9,t in 1:9],sum(x[i,j,t] for j in 1:9)<=1)
@constraint(n,[j in 1:9,t in 1:9],sum(x[i,j,t] for i in 1:9)<=1)

##for an example sudoku test this matrix is used

board=[1 0 5 9 0 0 7 6 0;
       0 2 0 0 0 3 0 0 0;
       0 0 6 0 0 7 0 8 1;
       0 0 4 0 0 0 5 1 0;
       8 0 0 0 4 0 0 0 0;
       0 5 0 0 0 0 8 0 0;
       2 0 9 0 0 0 1 0 5;
       0 0 0 5 6 0 0 9 0;
       0 0 0 0 2 0 0 0 3]

for i in 1:9
 for j in 1:9
  if board[i,j]!=0
    @constraint(n,v[i,j]==board[i,j])
  end
  end
end

i=3
k=3

for t in 1:9
  for i in 1:3
    for l in 1:3
      @constraint(n,sum(x[j+((i*3)-3):k+((i*3)-3),j+((l*3)-3):k+((l*3)-3),t])<=1)
      end
  end
end

@objective(n,Max,sum(x[i,j,t] for i in 1:9,j in 1:9,t in 1:9))

optimize!(n)

value.(v)
