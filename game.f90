program gameoflife
  use readwrite, only: writetofile, FNLEN
  implicit none

  logical, allocatable :: grid(:,:)
  integer, allocatable :: left(:,:), right(:,:), up(:,:), down(:,:)
  integer, parameter :: defX = 64, defY = 64
  character(len=FNLEN) :: filename
  integer :: h, w
  integer :: alloc_stat


  ! TO-DO: allow this to be changed
  h = defY
  w  = defX

  allocate(grid(h, w), left(h,w), right(h,w), up(h,w), down(h,w), stat = alloc_stat)
  if (alloc_stat/=0) stop

  grid = .false.
  filename = 'test.txt'
  alloc_stat = writetofile(grid, filename)

  deallocate(grid, left, right, up, down)



end program
