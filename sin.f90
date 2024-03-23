module trig_functions
    implicit none
    contains
    real function sin(x, n_terms)
        real, intent(in) :: x
        integer, intent(in) :: n_terms
        integer, dimension(0:3) :: dsin
        integer :: i
        real :: d_over_fact
        real :: f_x

        dsin(0) = 0 ! sin(x) at x = 0, sin(0) = 0
        dsin(1) = 1 ! dsin(x)/dx at x = 0, cos(0) = 1
        dsin(2) = 0 ! dsin^2 (x)/d^2 x at x = 0, -sin(0) = 0
        dsin(3) = -1! dsin^3 (x)/d^3 x at x = 0, -cos(0) = -1
        ! dsin(4) = 0! dsin^4 (x)/d^4 x at x = 0, sin(0) = 0, pattern repeats

        ! f(x) = sin(0) + dsin(x)/dx * x + d^2sin(x)/dx^2 * x^2 / 2! + d^3sin(x)/dx^3 / 3! + d^4sin(x)/dx^4 / 4! + ...
        f_x = 0
        d_over_fact = 1
        do i = 1, n_terms
            d_over_fact  = d_over_fact * x/i
            f_x  = f_x + dsin(modulo(i, 4))*d_over_fact
        end do
        sin = f_x
    end function sin
end module trig_functions

program main
    use trig_functions
    implicit none
    print *, sin(3.14/2, 1000)
end program main
