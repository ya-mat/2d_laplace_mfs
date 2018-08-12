! -*- coding: utf-8 -*-
program main
  use mod_force_raise
  implicit none

  real(8) :: rad
  real(8),allocatable :: x(:, :)
  real(8),allocatable :: l1(:, :)
  real(8),allocatable :: l2(:, :)
  real(8),allocatable :: kai(:)
  real(8),allocatable :: al(:)
  real(8),allocatable :: u(:)
  integer :: n
  real(8) :: rr
  real(8),parameter :: pi = 3.1415926535897932384626433832795028841971d0
  real(8),parameter :: arctwopi = 1d0/(2d0*pi)

  real(8) :: th
  integer :: i
  integer :: j
  integer,allocatable :: ipiv(:)
  integer :: info

  write(6,*) '# n, rad'
  open(1000, file='input', status='old')
  read(1000,*) n, rad
  close(1000)

  allocate(x(2, n))
  allocate(l1(n, n))
  allocate(l2(n, n))
  allocate(al(n))
  allocate(kai(n))
  allocate(ipiv(n))

  do i = 1, n
     th = 2d0*pi*(dble(i)+0.5d0)/dble(n)

     x(1, i) = rad*cos(th)
     x(2, i) = rad*sin(th)

     !x**3*y - x*y**3
     kai(i) = x(1, i)**3*x(2, i) - x(1, i)*x(2, i)**3
  end do

  al = kai

  do j = 1, n
     do i = 1, n
        rr = sqrt((x(1, i) - x(1, j))**2 + (x(2, i) - x(2, j))**2)
        if(rr .gt. 1d-13) then
           l1(i, j) = -log(rr)*arctwopi
        else
           l1(i, j) = 0d0
        end if
     end do
  end do

  l2 = l1

  call DGESV(n, 1, l1, n, ipiv, al, n, info)
  if(info.ne.0) then
     write(6,*) 'dgesv, info=', info
     call force_raise()
  endif
  deallocate(l1)
  deallocate(ipiv)

  u = matmul(l2, al)

  write(*,*) 'number of dof', n
  write(*,*) 'rad', rad
  write(*,*) 'relative error', sqrt(dot_product(u - kai, u - kai)/dot_product(kai, kai))

  deallocate(x)
  deallocate(l2)
  deallocate(kai)
  deallocate(al)
  deallocate(u)

end program main

