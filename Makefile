.PHONY: all clean install prepare release rpm

all:
	@cargo build --target=armv7-unknown-linux-gnueabihf

clean:
	@rm -rvf target

install:
	@scp ./target/armv7-unknown-linux-gnueabihf/release/aurora-rust-helloworld nemo@192.168.2.15:/home/nemo/
	@scp ./target/armv7-unknown-linux-gnueabihf/release/rpmbuild/RPMS/armv7hl/*.rpm nemo@192.168.2.15:/home/nemo/

prepare:
	@rustup target add armv7-unknown-linux-gnueabihf
	@cargo install cargo-rpm

release:
	@cargo build --release --target=armv7-unknown-linux-gnueabihf

rpm:
	@mkdir -p ./target/armv7-unknown-linux-gnueabihf/release/rpmbuild/SOURCES
	@cp -vf .rpm/aurora-rust-helloworld.desktop ./target/armv7-unknown-linux-gnueabihf/release/rpmbuild/SOURCES
	@cp -rvf .rpm/icons ./target/armv7-unknown-linux-gnueabihf/release/rpmbuild/SOURCES
	@cargo rpm build -v --target=armv7-unknown-linux-gnueabihf
