- 对称矩阵
    B==B.T，返回的是和矩阵形状一样的shape
- A.clone()
    把内存重新分配

- 点乘

    torch.sum(A*B)等价于 torch.dot(A,B)

- mv,mm
    matrix-vector
    matrix-matrix
    torch.mm(A,B)
    torch.mv(A,x)