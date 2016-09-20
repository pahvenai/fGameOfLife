module readwrite
  implicit none

  integer, parameter :: fnlen = 256, fhandle = 10

  interface writetofile
    module procedure writelogicalarray
  end interface

  contains
    integer function writelogicalarray(array, filename) result(writestat)
      logical, allocatable, intent(in) :: array(:,:)
      character(len=fnlen), intent(in) :: filename
      integer :: stat, ii, jj, sz(2)

      sz = shape(array)

      open(fhandle, file=filename, status="unknown", action="write", iostat=stat)
      if (stat /= 0) then
        writestat = stat
        return
      end if

      do ii = 1,sz(1)
        do jj = 1,sz(2)
          write (10,"(l1,1x)",advance='no',iostat=stat) array(ii,jj)
          if (stat /= 0) then
            writestat = stat
            return
          end if
        end do
        write (10,*)
      end do

      writestat = 0

    end function



end module
