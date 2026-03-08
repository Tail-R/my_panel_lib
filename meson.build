project('my_panel', 'vala')

deps = [
    dependency('gtk4')
]

src = [
    'src/app.vala',
    'src/widget.vala'
]

my_panel_lib = static_library(
    'my_panel',
    src,
    dependencies: deps
)

my_panel_dep = declare_dependency(
    link_with: my_panel_lib,
    dependencies: deps,
    include_directories: include_directories('src')
)

executable(
    'demo',
    'demo/main.vala',
    dependencies: my_panel_dep
)

