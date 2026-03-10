project('my_panel_lib', 'vala')

deps = [
    dependency('gtk4')
]

src = [
    'src/app.vala',
    'src/widget.vala'
]

my_panel_lib = static_library(
    'my_panel_lib',
    src,
    dependencies: deps,
    vala_header: 'my_panel_lib.h',
    vala_vapi: 'my_panel_lib.vapi'
)

my_panel_dep = declare_dependency(
    link_with: my_panel_lib,
    dependencies: deps,
    include_directories: include_directories('.')
)

executable(
    'demo',
    'demo/main.vala',
    dependencies: my_panel_dep
)

