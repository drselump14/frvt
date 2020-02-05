FROM centos:7.6.1810

# RUN yum -y update
RUN yum -y install gcc \
          git \
          cmake \
          gcc-c++ \
          utomake \
          make \
          libtool \
          cppunit \
          cppunit-devel

RUN yum install -y centos-release-scl \
               centos-release-scl-rh
RUN yum install -y devtoolset-7-gcc \
               devtoolset-7-gcc-c++ \
           devtool \
           devtoolset-7-valgrind \
           devtoolset-7-strace devtoolset-7-gdb \
           devtoolset-7-gcc-gdb-plugin


WORKDIR frvt

COPY . .

WORKDIR /frvt/11

RUN mkdir -p doc
RUN touch doc/version.txt
RUN mkdir -p config
RUN echo "build null implementation"
RUN ./scripts/build_null_impl.sh


WORKDIR /frvt/1N
RUN mkdir -p doc
RUN touch doc/version.txt
RUN mkdir -p config
RUN echo "build null implementation"
RUN ./scripts/build_null_impl.sh

WORKDIR /frvt/morph
RUN mkdir -p doc
RUN touch doc/version.txt
RUN mkdir -p config
RUN echo "build null implementation"
RUN ./scripts/build_null_impl.sh

WORKDIR /frvt/quality
RUN mkdir -p doc
RUN touch doc/version.txt
RUN mkdir -p config
RUN echo "build null implementation"
RUN ./scripts/build_null_impl.sh

WORKDIR /frvt

RUN mkdir -p artifacts

