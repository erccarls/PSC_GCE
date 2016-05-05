
    #/bin/sh 
    cd /data/wavelets/fermi_output

    echo "Get a beer. This will take a while..."

    # echo "running gtselect"
    # gtselect /data/fermi_data_6-26-15/phfile.txt photons_merged_P8R2_PSF3_CLEAN_wavelets.fits\
    #     ra=INDEF dec=INDEF rad=INDEF tmin=INDEF tmax=INDEF\
    #     zmax=90 emin=500.0 emax=100000.0\
    #     evclass=256 clobber=True evtype=32

    # echo "running gtmktime"
    # gtmktime scfile=/data/fermi_data_6-26-15/lat_spacecraft_merged.fits filter="DATA_QUAL>0 && LAT_CONFIG==1 && ABS(ROCK_ANGLE)<52"\
    #     roicut=no evfile=photons_merged_P8R2_PSF3_CLEAN_wavelets.fits\
    #     outfile=photons_merged_cut_P8R2_PSF3_CLEAN_wavelets.fits\
    #     clobber=True

    # rm photons_merged_P8R2_PSF3_CLEAN_wavelets.fits

    # echo "running gtltcube"

    # gtltcube evfile=photons_merged_cut_P8R2_PSF3_CLEAN_wavelets.fits\
    #     scfile=/data/fermi_data_6-26-15/lat_spacecraft_merged.fits\
    #     outfile="cube_P8R2_PSF3_CLEAN_wavelets.fits"\
    #     dcostheta=0.1 binsz=1 zmin=0 zmax=180 clobber=True

    # # make ebin file
    # echo "running gtbindef"
    # gtbindef bintype=E binfile=bin_edges_P8R2_PSF3_CLEAN_wavelets.dat\
    #      outfile=ebins_P8R2_PSF3_CLEAN_wavelets.fits energyunits=MeV\
    #     clobber=True

    # make psf file
    echo "running gtpsf"
    gtpsf expcube="cube_P8R2_PSF3_CLEAN_wavelets.fits"\
        outfile=gtpsf_P8R2_PSF3_CLEAN_wavelets.fits\
        irfs=P8R2_CLEAN_V6\
        emin=500 emax=1e6 nenergies=100 clobber=True\
        ra=0 dec=0 thetamax=20 ntheta=500 evtype=32

    # echo "running gtbin"
    # gtbin evfile=photons_merged_cut_P8R2_PSF3_CLEAN_wavelets.fits \
    #     scfile=/data/fermi_data_6-26-15/lat_spacecraft_merged.fits\
    #     outfile="gtbin_P8R2_PSF3_CLEAN_wavelets.fits"\
    #     algorithm=CCUBE nxpix=721 nypix=361\
    #     ebinalg=FILE ebinfile=ebins_P8R2_PSF3_CLEAN_wavelets.fits\
    #     coordsys=GAL proj=CAR xref=0 yref=0 axisrot=0 binsz=0.5\
    #     clobber=True

    # echo "running gtexpcube2"
    # gtexpcube2 infile="cube_P8R2_PSF3_CLEAN_wavelets.fits"\
    #     cmap="gtbin_P8R2_PSF3_CLEAN_wavelets.fits"\
    #     coordsys=GAL outfile="gtexpcube2_P8R2_PSF3_CLEAN_wavelets.fits"\
    #     irf=P8R2_CLEAN_V6\
    #     ebinfile=ebins_P8R2_PSF3_CLEAN_wavelets.fits\
    #     ebinalg=FILE clobber=True proj=CAR evtype=32