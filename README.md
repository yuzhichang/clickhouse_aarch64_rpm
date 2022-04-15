# clickhouse_aarch64_rpm

Build rpms for aarch64 linux since they are not provided by the [offical site](https://clickhouse.com/#quick-start).

- Build the static linked executeable `clickhouse` according to [build.md](https://github.com/ClickHouse/ClickHouse/blob/master/docs/en/development/build.md).

- Install [prename](https://centos.pkgs.org/7/epel-x86_64/prename-1.9-5.el7.noarch.rpm.html).

- Install [nfpm](https://github.com/goreleaser/nfpm).

- Build rpms

```
$ ln -s <path_to_clickhouse_executable_dir> programs
$ VERSION=22.4.1.1 make
```

- Install clickhouse rpms

```
# rpm -ivh --nodeps clickhouse*.rpm
```
