PACKAGES=ar-release ar-consumer ar-sync ar-compute ar-local-compute ar-web-api poem ar-data-retention
SRC_DIRS=../ar-release ../ar-consumer ../ar-sync ../ar-compute-engine ../ar-web-api ../poem ../ar-data-retention
SPEC_FILES=../ar-release/ar-release.spec ../ar-consumer/ar-consumer.spec ../ar-sync/ar-sync.spec ../ar-compute-engine/ar-compute.spec ../ar-compute-engine/ar-local-compute.spec ../ar-web-api/ar-web-api.spec ../poem/poem.spec ../ar-data-retention/ar-data-retention.spec

sources:
	for i in ${SRC_DIRS}; do cd $$i ; make sources ; done
	cd ../ar-compute-engine; make -f Makefile.local sources ; cd ../ar-builder
	for i in ${SRC_DIRS}; do mv $$i/*.tar.gz . ; done

rpms: sources
	for i in ${PACKAGES}; do rpmbuild -ta --define='dist .el6' $$i*gz ; done

clean:
	rm -f *.tar.gz;


