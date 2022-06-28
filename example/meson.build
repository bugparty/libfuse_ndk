examples = [ 
             'hello', 'hello_ll', 'printcap',
             'ioctl_client', 'poll_client', 'ioctl',
             'cuse', 'cuse_client' ]


threaded_examples = [ 'notify_inval_inode',
                      'invalidate_path',
                      'notify_store_retrieve',
                      'notify_inval_entry',
                      'poll' ]

foreach ex : examples
    executable(ex, ex + '.c',
               dependencies: [ libfuse_dep ],
               install: false)
endforeach


foreach ex : threaded_examples
    executable(ex, ex + '.c',
               dependencies: [ thread_dep, libfuse_dep ],
               install: false)
endforeach



# TODO: Link passthrough_fh with ulockmgr if available
