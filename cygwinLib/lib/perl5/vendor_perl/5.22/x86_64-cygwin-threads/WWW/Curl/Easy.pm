package WWW::Curl::Easy;

use strict;
use warnings;
use Carp;

our $VERSION = '4.17';

use WWW::Curl ();
use Exporter  ();

our @ISA = qw(Exporter);

# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.

our @EXPORT = qw(
CURL_CHUNK_BGN_FUNC_FAIL
CURL_CHUNK_BGN_FUNC_OK
CURL_CHUNK_BGN_FUNC_SKIP
CURL_CHUNK_END_FUNC_FAIL
CURL_CHUNK_END_FUNC_OK
CURL_ERROR_SIZE
CURL_FNMATCHFUNC_FAIL
CURL_FNMATCHFUNC_MATCH
CURL_FNMATCHFUNC_NOMATCH
CURL_FORMADD_DISABLED
CURL_FORMADD_ILLEGAL_ARRAY
CURL_FORMADD_INCOMPLETE
CURL_FORMADD_MEMORY
CURL_FORMADD_NULL
CURL_FORMADD_OK
CURL_FORMADD_OPTION_TWICE
CURL_FORMADD_UNKNOWN_OPTION
CURL_GLOBAL_ACK_EINTR
CURL_GLOBAL_ALL
CURL_GLOBAL_DEFAULT
CURL_GLOBAL_NOTHING
CURL_GLOBAL_SSL
CURL_GLOBAL_WIN32
CURL_HTTP_VERSION_1_0
CURL_HTTP_VERSION_1_1
CURL_HTTP_VERSION_2
CURL_HTTP_VERSION_2_0
CURL_HTTP_VERSION_NONE
CURL_IPRESOLVE_V4
CURL_IPRESOLVE_V6
CURL_IPRESOLVE_WHATEVER
CURL_LOCK_ACCESS_NONE
CURL_LOCK_ACCESS_SHARED
CURL_LOCK_ACCESS_SINGLE
CURL_LOCK_DATA_CONNECT
CURL_LOCK_DATA_COOKIE
CURL_LOCK_DATA_DNS
CURL_LOCK_DATA_NONE
CURL_LOCK_DATA_SHARE
CURL_LOCK_DATA_SSL_SESSION
CURL_MAX_HTTP_HEADER
CURL_MAX_WRITE_SIZE
CURL_NETRC_IGNORED
CURL_NETRC_OPTIONAL
CURL_NETRC_REQUIRED
CURL_READFUNC_ABORT
CURL_READFUNC_PAUSE
CURL_REDIR_GET_ALL
CURL_REDIR_POST_301
CURL_REDIR_POST_302
CURL_REDIR_POST_303
CURL_REDIR_POST_ALL
CURL_RTSPREQ_ANNOUNCE
CURL_RTSPREQ_DESCRIBE
CURL_RTSPREQ_GET_PARAMETER
CURL_RTSPREQ_NONE
CURL_RTSPREQ_OPTIONS
CURL_RTSPREQ_PAUSE
CURL_RTSPREQ_PLAY
CURL_RTSPREQ_RECEIVE
CURL_RTSPREQ_RECORD
CURL_RTSPREQ_SETUP
CURL_RTSPREQ_SET_PARAMETER
CURL_RTSPREQ_TEARDOWN
CURL_SEEKFUNC_CANTSEEK
CURL_SEEKFUNC_FAIL
CURL_SEEKFUNC_OK
CURL_SOCKET_BAD
CURL_SOCKOPT_ALREADY_CONNECTED
CURL_SOCKOPT_ERROR
CURL_SOCKOPT_OK
CURL_SSLVERSION_DEFAULT
CURL_SSLVERSION_SSLv2
CURL_SSLVERSION_SSLv3
CURL_SSLVERSION_TLSv1
CURL_SSLVERSION_TLSv1_0
CURL_SSLVERSION_TLSv1_1
CURL_SSLVERSION_TLSv1_2
CURL_TIMECOND_IFMODSINCE
CURL_TIMECOND_IFUNMODSINCE
CURL_TIMECOND_LASTMOD
CURL_TIMECOND_NONE
CURL_TLSAUTH_NONE
CURL_TLSAUTH_SRP
CURL_VERSION_ASYNCHDNS
CURL_VERSION_CONV
CURL_VERSION_CURLDEBUG
CURL_VERSION_DEBUG
CURL_VERSION_GSSAPI
CURL_VERSION_GSSNEGOTIATE
CURL_VERSION_HTTP2
CURL_VERSION_IDN
CURL_VERSION_IPV6
CURL_VERSION_KERBEROS4
CURL_VERSION_KERBEROS5
CURL_VERSION_LARGEFILE
CURL_VERSION_LIBZ
CURL_VERSION_NTLM
CURL_VERSION_NTLM_WB
CURL_VERSION_SPNEGO
CURL_VERSION_SSL
CURL_VERSION_SSPI
CURL_VERSION_TLSAUTH_SRP
CURL_VERSION_UNIX_SOCKETS
CURL_WRITEFUNC_PAUSE
CURLVERSION_FIRST
CURLVERSION_FOURTH
CURLVERSION_NOW
CURLVERSION_SECOND
CURLVERSION_THIRD
CURLUSESSL_ALL
CURLUSESSL_CONTROL
CURLUSESSL_NONE
CURLUSESSL_TRY
CURLSSLOPT_ALLOW_BEAST
CURLSSLBACKEND_AXTLS
CURLSSLBACKEND_CYASSL
CURLSSLBACKEND_DARWINSSL
CURLSSLBACKEND_GNUTLS
CURLSSLBACKEND_GSKIT
CURLSSLBACKEND_NONE
CURLSSLBACKEND_NSS
CURLSSLBACKEND_OPENSSL
CURLSSLBACKEND_POLARSSL
CURLSSLBACKEND_SCHANNEL
CURLSSH_AUTH_AGENT
CURLSSH_AUTH_ANY
CURLSSH_AUTH_DEFAULT
CURLSSH_AUTH_HOST
CURLSSH_AUTH_KEYBOARD
CURLSSH_AUTH_NONE
CURLSSH_AUTH_PASSWORD
CURLSSH_AUTH_PUBLICKEY
CURLSOCKTYPE_ACCEPT
CURLSOCKTYPE_IPCXN
CURLSHOPT_LOCKFUNC
CURLSHOPT_NONE
CURLSHOPT_SHARE
CURLSHOPT_UNLOCKFUNC
CURLSHOPT_UNSHARE
CURLSHOPT_USERDATA
CURLSHE_BAD_OPTION
CURLSHE_INVALID
CURLSHE_IN_USE
CURLSHE_NOMEM
CURLSHE_NOT_BUILT_IN
CURLSHE_OK
CURLPROXY_HTTP
CURLPROXY_HTTP_1_0
CURLPROXY_SOCKS4
CURLPROXY_SOCKS4A
CURLPROXY_SOCKS5
CURLPROXY_SOCKS5_HOSTNAME
CURLPROTO_ALL
CURLPROTO_DICT
CURLPROTO_FILE
CURLPROTO_FTP
CURLPROTO_FTPS
CURLPROTO_GOPHER
CURLPROTO_HTTP
CURLPROTO_HTTPS
CURLPROTO_IMAP
CURLPROTO_IMAPS
CURLPROTO_LDAP
CURLPROTO_LDAPS
CURLPROTO_POP3
CURLPROTO_POP3S
CURLPROTO_RTMP
CURLPROTO_RTMPE
CURLPROTO_RTMPS
CURLPROTO_RTMPT
CURLPROTO_RTMPTE
CURLPROTO_RTMPTS
CURLPROTO_RTSP
CURLPROTO_SCP
CURLPROTO_SFTP
CURLPROTO_SMB
CURLPROTO_SMBS
CURLPROTO_SMTP
CURLPROTO_SMTPS
CURLPROTO_TELNET
CURLPROTO_TFTP
CURLPAUSE_ALL
CURLPAUSE_CONT
CURLPAUSE_RECV
CURLPAUSE_RECV_CONT
CURLPAUSE_SEND
CURLPAUSE_SEND_CONT
CURLOPT_ACCEPTTIMEOUT_MS
CURLOPT_ACCEPT_ENCODING
CURLOPT_ADDRESS_SCOPE
CURLOPT_APPEND
CURLOPT_AUTOREFERER
CURLOPT_BUFFERSIZE
CURLOPT_CAINFO
CURLOPT_CAPATH
CURLOPT_CERTINFO
CURLOPT_CHUNK_BGN_FUNCTION
CURLOPT_CHUNK_DATA
CURLOPT_CHUNK_END_FUNCTION
CURLOPT_CLOSEPOLICY
CURLOPT_CLOSESOCKETDATA
CURLOPT_CLOSESOCKETFUNCTION
CURLOPT_CONNECTTIMEOUT
CURLOPT_CONNECTTIMEOUT_MS
CURLOPT_CONNECT_ONLY
CURLOPT_CONV_FROM_NETWORK_FUNCTION
CURLOPT_CONV_FROM_UTF8_FUNCTION
CURLOPT_CONV_TO_NETWORK_FUNCTION
CURLOPT_COOKIE
CURLOPT_COOKIEFILE
CURLOPT_COOKIEJAR
CURLOPT_COOKIELIST
CURLOPT_COOKIESESSION
CURLOPT_COPYPOSTFIELDS
CURLOPT_CRLF
CURLOPT_CRLFILE
CURLOPT_CUSTOMREQUEST
CURLOPT_DEBUGDATA
CURLOPT_DEBUGFUNCTION
CURLOPT_DIRLISTONLY
CURLOPT_DNS_CACHE_TIMEOUT
CURLOPT_DNS_INTERFACE
CURLOPT_DNS_LOCAL_IP4
CURLOPT_DNS_LOCAL_IP6
CURLOPT_DNS_SERVERS
CURLOPT_DNS_USE_GLOBAL_CACHE
CURLOPT_EGDSOCKET
CURLOPT_ENCODING
CURLOPT_ERRORBUFFER
CURLOPT_EXPECT_100_TIMEOUT_MS
CURLOPT_FAILONERROR
CURLOPT_FILE
CURLOPT_FILETIME
CURLOPT_FNMATCH_DATA
CURLOPT_FNMATCH_FUNCTION
CURLOPT_FOLLOWLOCATION
CURLOPT_FORBID_REUSE
CURLOPT_FRESH_CONNECT
CURLOPT_FTPAPPEND
CURLOPT_FTPLISTONLY
CURLOPT_FTPPORT
CURLOPT_FTPSSLAUTH
CURLOPT_FTP_ACCOUNT
CURLOPT_FTP_ALTERNATIVE_TO_USER
CURLOPT_FTP_CREATE_MISSING_DIRS
CURLOPT_FTP_FILEMETHOD
CURLOPT_FTP_RESPONSE_TIMEOUT
CURLOPT_FTP_SKIP_PASV_IP
CURLOPT_FTP_SSL
CURLOPT_FTP_SSL_CCC
CURLOPT_FTP_USE_EPRT
CURLOPT_FTP_USE_EPSV
CURLOPT_FTP_USE_PRET
CURLOPT_GSSAPI_DELEGATION
CURLOPT_HEADER
CURLOPT_HEADERDATA
CURLOPT_HEADERFUNCTION
CURLOPT_HEADEROPT
CURLOPT_HTTP200ALIASES
CURLOPT_HTTPAUTH
CURLOPT_HTTPGET
CURLOPT_HTTPHEADER
CURLOPT_HTTPPOST
CURLOPT_HTTPPROXYTUNNEL
CURLOPT_HTTP_CONTENT_DECODING
CURLOPT_HTTP_TRANSFER_DECODING
CURLOPT_HTTP_VERSION
CURLOPT_IGNORE_CONTENT_LENGTH
CURLOPT_INFILE
CURLOPT_INFILESIZE
CURLOPT_INFILESIZE_LARGE
CURLOPT_INTERFACE
CURLOPT_INTERLEAVEDATA
CURLOPT_INTERLEAVEFUNCTION
CURLOPT_IOCTLDATA
CURLOPT_IOCTLFUNCTION
CURLOPT_IPRESOLVE
CURLOPT_ISSUERCERT
CURLOPT_KEYPASSWD
CURLOPT_KRB4LEVEL
CURLOPT_KRBLEVEL
CURLOPT_LOCALPORT
CURLOPT_LOCALPORTRANGE
CURLOPT_LOGIN_OPTIONS
CURLOPT_LOW_SPEED_LIMIT
CURLOPT_LOW_SPEED_TIME
CURLOPT_MAIL_AUTH
CURLOPT_MAIL_FROM
CURLOPT_MAIL_RCPT
CURLOPT_MAXCONNECTS
CURLOPT_MAXFILESIZE
CURLOPT_MAXFILESIZE_LARGE
CURLOPT_MAXREDIRS
CURLOPT_MAX_RECV_SPEED_LARGE
CURLOPT_MAX_SEND_SPEED_LARGE
CURLOPT_NETRC
CURLOPT_NETRC_FILE
CURLOPT_NEW_DIRECTORY_PERMS
CURLOPT_NEW_FILE_PERMS
CURLOPT_NOBODY
CURLOPT_NOPROGRESS
CURLOPT_NOPROXY
CURLOPT_NOSIGNAL
CURLOPT_OPENSOCKETDATA
CURLOPT_OPENSOCKETFUNCTION
CURLOPT_PASSWORD
CURLOPT_PATH_AS_IS
CURLOPT_PINNEDPUBLICKEY
CURLOPT_PIPEWAIT
CURLOPT_PORT
CURLOPT_POST
CURLOPT_POST301
CURLOPT_POSTFIELDS
CURLOPT_POSTFIELDSIZE
CURLOPT_POSTFIELDSIZE_LARGE
CURLOPT_POSTQUOTE
CURLOPT_POSTREDIR
CURLOPT_PREQUOTE
CURLOPT_PRIVATE
CURLOPT_PROGRESSDATA
CURLOPT_PROGRESSFUNCTION
CURLOPT_PROTOCOLS
CURLOPT_PROXY
CURLOPT_PROXYAUTH
CURLOPT_PROXYHEADER
CURLOPT_PROXYPASSWORD
CURLOPT_PROXYPORT
CURLOPT_PROXYTYPE
CURLOPT_PROXYUSERNAME
CURLOPT_PROXYUSERPWD
CURLOPT_PROXY_SERVICE_NAME
CURLOPT_PROXY_TRANSFER_MODE
CURLOPT_PUT
CURLOPT_QUOTE
CURLOPT_RANDOM_FILE
CURLOPT_RANGE
CURLOPT_READDATA
CURLOPT_READFUNCTION
CURLOPT_REDIR_PROTOCOLS
CURLOPT_REFERER
CURLOPT_RESOLVE
CURLOPT_RESUME_FROM
CURLOPT_RESUME_FROM_LARGE
CURLOPT_RTSPHEADER
CURLOPT_RTSP_CLIENT_CSEQ
CURLOPT_RTSP_REQUEST
CURLOPT_RTSP_SERVER_CSEQ
CURLOPT_RTSP_SESSION_ID
CURLOPT_RTSP_STREAM_URI
CURLOPT_RTSP_TRANSPORT
CURLOPT_SASL_IR
CURLOPT_SEEKDATA
CURLOPT_SEEKFUNCTION
CURLOPT_SERVER_RESPONSE_TIMEOUT
CURLOPT_SERVICE_NAME
CURLOPT_SHARE
CURLOPT_SOCKOPTDATA
CURLOPT_SOCKOPTFUNCTION
CURLOPT_SOCKS5_GSSAPI_NEC
CURLOPT_SOCKS5_GSSAPI_SERVICE
CURLOPT_SSH_AUTH_TYPES
CURLOPT_SSH_HOST_PUBLIC_KEY_MD5
CURLOPT_SSH_KEYDATA
CURLOPT_SSH_KEYFUNCTION
CURLOPT_SSH_KNOWNHOSTS
CURLOPT_SSH_PRIVATE_KEYFILE
CURLOPT_SSH_PUBLIC_KEYFILE
CURLOPT_SSLCERT
CURLOPT_SSLCERTPASSWD
CURLOPT_SSLCERTTYPE
CURLOPT_SSLENGINE
CURLOPT_SSLENGINE_DEFAULT
CURLOPT_SSLKEY
CURLOPT_SSLKEYPASSWD
CURLOPT_SSLKEYTYPE
CURLOPT_SSLVERSION
CURLOPT_SSL_CIPHER_LIST
CURLOPT_SSL_CTX_DATA
CURLOPT_SSL_CTX_FUNCTION
CURLOPT_SSL_ENABLE_ALPN
CURLOPT_SSL_ENABLE_NPN
CURLOPT_SSL_FALSESTART
CURLOPT_SSL_OPTIONS
CURLOPT_SSL_SESSIONID_CACHE
CURLOPT_SSL_VERIFYHOST
CURLOPT_SSL_VERIFYPEER
CURLOPT_SSL_VERIFYSTATUS
CURLOPT_STDERR
CURLOPT_TCP_KEEPALIVE
CURLOPT_TCP_KEEPIDLE
CURLOPT_TCP_KEEPINTVL
CURLOPT_TCP_NODELAY
CURLOPT_TELNETOPTIONS
CURLOPT_TFTP_BLKSIZE
CURLOPT_TIMECONDITION
CURLOPT_TIMEOUT
CURLOPT_TIMEOUT_MS
CURLOPT_TIMEVALUE
CURLOPT_TLSAUTH_PASSWORD
CURLOPT_TLSAUTH_TYPE
CURLOPT_TLSAUTH_USERNAME
CURLOPT_TRANSFERTEXT
CURLOPT_TRANSFER_ENCODING
CURLOPT_UNIX_SOCKET_PATH
CURLOPT_UNRESTRICTED_AUTH
CURLOPT_UPLOAD
CURLOPT_URL
CURLOPT_USERAGENT
CURLOPT_USERNAME
CURLOPT_USERPWD
CURLOPT_USE_SSL
CURLOPT_VERBOSE
CURLOPT_WILDCARDMATCH
CURLOPT_WRITEDATA
CURLOPT_WRITEFUNCTION
CURLOPT_WRITEHEADER
CURLOPT_WRITEINFO
CURLOPT_XFERINFODATA
CURLOPT_XFERINFOFUNCTION
CURLOPT_XOAUTH2_BEARER
CURLOPTTYPE_FUNCTIONPOINT
CURLOPTTYPE_LONG
CURLOPTTYPE_OBJECTPOINT
CURLOPTTYPE_OFF_T
CURLM_ADDED_ALREADY
CURLM_BAD_EASY_HANDLE
CURLM_BAD_HANDLE
CURLM_BAD_SOCKET
CURLM_CALL_MULTI_PERFORM
CURLM_INTERNAL_ERROR
CURLM_OK
CURLM_OUT_OF_MEMORY
CURLM_UNKNOWN_OPTION
CURLMSG_DONE
CURLMSG_NONE
CURLMOPT_CHUNK_LENGTH_PENALTY_SIZE
CURLMOPT_CONTENT_LENGTH_PENALTY_SIZE
CURLMOPT_MAXCONNECTS
CURLMOPT_MAX_HOST_CONNECTIONS
CURLMOPT_MAX_PIPELINE_LENGTH
CURLMOPT_MAX_TOTAL_CONNECTIONS
CURLMOPT_PIPELINING
CURLMOPT_PIPELINING_SERVER_BL
CURLMOPT_PIPELINING_SITE_BL
CURLMOPT_SOCKETDATA
CURLMOPT_SOCKETFUNCTION
CURLMOPT_TIMERDATA
CURLMOPT_TIMERFUNCTION
CURLKHTYPE_DSS
CURLKHTYPE_RSA
CURLKHTYPE_RSA1
CURLKHTYPE_UNKNOWN
CURLKHSTAT_DEFER
CURLKHSTAT_FINE
CURLKHSTAT_FINE_ADD_TO_FILE
CURLKHSTAT_REJECT
CURLKHMATCH_MISMATCH
CURLKHMATCH_MISSING
CURLKHMATCH_OK
CURLIOE_FAILRESTART
CURLIOE_OK
CURLIOE_UNKNOWNCMD
CURLIOCMD_NOP
CURLIOCMD_RESTARTREAD
CURLINFO_APPCONNECT_TIME
CURLINFO_CERTINFO
CURLINFO_CONDITION_UNMET
CURLINFO_CONNECT_TIME
CURLINFO_CONTENT_LENGTH_DOWNLOAD
CURLINFO_CONTENT_LENGTH_UPLOAD
CURLINFO_CONTENT_TYPE
CURLINFO_COOKIELIST
CURLINFO_DATA_IN
CURLINFO_DATA_OUT
CURLINFO_DOUBLE
CURLINFO_EFFECTIVE_URL
CURLINFO_END
CURLINFO_FILETIME
CURLINFO_FTP_ENTRY_PATH
CURLINFO_HEADER_IN
CURLINFO_HEADER_OUT
CURLINFO_HEADER_SIZE
CURLINFO_HTTPAUTH_AVAIL
CURLINFO_HTTP_CODE
CURLINFO_HTTP_CONNECTCODE
CURLINFO_LASTONE
CURLINFO_LASTSOCKET
CURLINFO_LOCAL_IP
CURLINFO_LOCAL_PORT
CURLINFO_LONG
CURLINFO_MASK
CURLINFO_NAMELOOKUP_TIME
CURLINFO_NONE
CURLINFO_NUM_CONNECTS
CURLINFO_OS_ERRNO
CURLINFO_PRETRANSFER_TIME
CURLINFO_PRIMARY_IP
CURLINFO_PRIMARY_PORT
CURLINFO_PRIVATE
CURLINFO_PROXYAUTH_AVAIL
CURLINFO_REDIRECT_COUNT
CURLINFO_REDIRECT_TIME
CURLINFO_REDIRECT_URL
CURLINFO_REQUEST_SIZE
CURLINFO_RESPONSE_CODE
CURLINFO_RTSP_CLIENT_CSEQ
CURLINFO_RTSP_CSEQ_RECV
CURLINFO_RTSP_SERVER_CSEQ
CURLINFO_RTSP_SESSION_ID
CURLINFO_SIZE_DOWNLOAD
CURLINFO_SIZE_UPLOAD
CURLINFO_SLIST
CURLINFO_SPEED_DOWNLOAD
CURLINFO_SPEED_UPLOAD
CURLINFO_SSL_DATA_IN
CURLINFO_SSL_DATA_OUT
CURLINFO_SSL_ENGINES
CURLINFO_SSL_VERIFYRESULT
CURLINFO_STARTTRANSFER_TIME
CURLINFO_STRING
CURLINFO_TEXT
CURLINFO_TLS_SESSION
CURLINFO_TOTAL_TIME
CURLINFO_TYPEMASK
CURLHEADER_SEPARATE
CURLHEADER_UNIFIED
CURLGSSAPI_DELEGATION_FLAG
CURLGSSAPI_DELEGATION_NONE
CURLGSSAPI_DELEGATION_POLICY_FLAG
CURLFTP_CREATE_DIR
CURLFTP_CREATE_DIR_NONE
CURLFTP_CREATE_DIR_RETRY
CURLFTPSSL_ALL
CURLFTPSSL_CCC_ACTIVE
CURLFTPSSL_CCC_NONE
CURLFTPSSL_CCC_PASSIVE
CURLFTPSSL_CONTROL
CURLFTPSSL_NONE
CURLFTPSSL_TRY
CURLFTPMETHOD_DEFAULT
CURLFTPMETHOD_MULTICWD
CURLFTPMETHOD_NOCWD
CURLFTPMETHOD_SINGLECWD
CURLFTPAUTH_DEFAULT
CURLFTPAUTH_SSL
CURLFTPAUTH_TLS
CURLFORM_ARRAY
CURLFORM_BUFFER
CURLFORM_BUFFERLENGTH
CURLFORM_BUFFERPTR
CURLFORM_CONTENTHEADER
CURLFORM_CONTENTSLENGTH
CURLFORM_CONTENTTYPE
CURLFORM_COPYCONTENTS
CURLFORM_COPYNAME
CURLFORM_END
CURLFORM_FILE
CURLFORM_FILECONTENT
CURLFORM_FILENAME
CURLFORM_NAMELENGTH
CURLFORM_NOTHING
CURLFORM_PTRCONTENTS
CURLFORM_PTRNAME
CURLFORM_STREAM
CURLFINFOFLAG_KNOWN_FILENAME
CURLFINFOFLAG_KNOWN_FILETYPE
CURLFINFOFLAG_KNOWN_GID
CURLFINFOFLAG_KNOWN_HLINKCOUNT
CURLFINFOFLAG_KNOWN_PERM
CURLFINFOFLAG_KNOWN_SIZE
CURLFINFOFLAG_KNOWN_TIME
CURLFINFOFLAG_KNOWN_UID
CURLFILETYPE_DEVICE_BLOCK
CURLFILETYPE_DEVICE_CHAR
CURLFILETYPE_DIRECTORY
CURLFILETYPE_DOOR
CURLFILETYPE_FILE
CURLFILETYPE_NAMEDPIPE
CURLFILETYPE_SOCKET
CURLFILETYPE_SYMLINK
CURLFILETYPE_UNKNOWN
CURLE_ABORTED_BY_CALLBACK
CURLE_AGAIN
CURLE_ALREADY_COMPLETE
CURLE_BAD_CALLING_ORDER
CURLE_BAD_CONTENT_ENCODING
CURLE_BAD_DOWNLOAD_RESUME
CURLE_BAD_FUNCTION_ARGUMENT
CURLE_BAD_PASSWORD_ENTERED
CURLE_CHUNK_FAILED
CURLE_CONV_FAILED
CURLE_CONV_REQD
CURLE_COULDNT_CONNECT
CURLE_COULDNT_RESOLVE_HOST
CURLE_COULDNT_RESOLVE_PROXY
CURLE_FAILED_INIT
CURLE_FILESIZE_EXCEEDED
CURLE_FILE_COULDNT_READ_FILE
CURLE_FTP_ACCEPT_FAILED
CURLE_FTP_ACCEPT_TIMEOUT
CURLE_FTP_ACCESS_DENIED
CURLE_FTP_BAD_DOWNLOAD_RESUME
CURLE_FTP_BAD_FILE_LIST
CURLE_FTP_CANT_GET_HOST
CURLE_FTP_CANT_RECONNECT
CURLE_FTP_COULDNT_GET_SIZE
CURLE_FTP_COULDNT_RETR_FILE
CURLE_FTP_COULDNT_SET_ASCII
CURLE_FTP_COULDNT_SET_BINARY
CURLE_FTP_COULDNT_SET_TYPE
CURLE_FTP_COULDNT_STOR_FILE
CURLE_FTP_COULDNT_USE_REST
CURLE_FTP_PARTIAL_FILE
CURLE_FTP_PORT_FAILED
CURLE_FTP_PRET_FAILED
CURLE_FTP_QUOTE_ERROR
CURLE_FTP_SSL_FAILED
CURLE_FTP_USER_PASSWORD_INCORRECT
CURLE_FTP_WEIRD_227_FORMAT
CURLE_FTP_WEIRD_PASS_REPLY
CURLE_FTP_WEIRD_PASV_REPLY
CURLE_FTP_WEIRD_SERVER_REPLY
CURLE_FTP_WEIRD_USER_REPLY
CURLE_FTP_WRITE_ERROR
CURLE_FUNCTION_NOT_FOUND
CURLE_GOT_NOTHING
CURLE_HTTP2
CURLE_HTTP_NOT_FOUND
CURLE_HTTP_PORT_FAILED
CURLE_HTTP_POST_ERROR
CURLE_HTTP_RANGE_ERROR
CURLE_HTTP_RETURNED_ERROR
CURLE_INTERFACE_FAILED
CURLE_LDAP_CANNOT_BIND
CURLE_LDAP_INVALID_URL
CURLE_LDAP_SEARCH_FAILED
CURLE_LIBRARY_NOT_FOUND
CURLE_LOGIN_DENIED
CURLE_MALFORMAT_USER
CURLE_NOT_BUILT_IN
CURLE_NO_CONNECTION_AVAILABLE
CURLE_OK
CURLE_OPERATION_TIMEDOUT
CURLE_OPERATION_TIMEOUTED
CURLE_OUT_OF_MEMORY
CURLE_PARTIAL_FILE
CURLE_PEER_FAILED_VERIFICATION
CURLE_QUOTE_ERROR
CURLE_RANGE_ERROR
CURLE_READ_ERROR
CURLE_RECV_ERROR
CURLE_REMOTE_ACCESS_DENIED
CURLE_REMOTE_DISK_FULL
CURLE_REMOTE_FILE_EXISTS
CURLE_REMOTE_FILE_NOT_FOUND
CURLE_RTSP_CSEQ_ERROR
CURLE_RTSP_SESSION_ERROR
CURLE_SEND_ERROR
CURLE_SEND_FAIL_REWIND
CURLE_SHARE_IN_USE
CURLE_SSH
CURLE_SSL_CACERT
CURLE_SSL_CACERT_BADFILE
CURLE_SSL_CERTPROBLEM
CURLE_SSL_CIPHER
CURLE_SSL_CONNECT_ERROR
CURLE_SSL_CRL_BADFILE
CURLE_SSL_ENGINE_INITFAILED
CURLE_SSL_ENGINE_NOTFOUND
CURLE_SSL_ENGINE_SETFAILED
CURLE_SSL_INVALIDCERTSTATUS
CURLE_SSL_ISSUER_ERROR
CURLE_SSL_PEER_CERTIFICATE
CURLE_SSL_PINNEDPUBKEYNOTMATCH
CURLE_SSL_SHUTDOWN_FAILED
CURLE_TELNET_OPTION_SYNTAX
CURLE_TFTP_DISKFULL
CURLE_TFTP_EXISTS
CURLE_TFTP_ILLEGAL
CURLE_TFTP_NOSUCHUSER
CURLE_TFTP_NOTFOUND
CURLE_TFTP_PERM
CURLE_TFTP_UNKNOWNID
CURLE_TOO_MANY_REDIRECTS
CURLE_UNKNOWN_OPTION
CURLE_UNKNOWN_TELNET_OPTION
CURLE_UNSUPPORTED_PROTOCOL
CURLE_UPLOAD_FAILED
CURLE_URL_MALFORMAT
CURLE_URL_MALFORMAT_USER
CURLE_USE_SSL_FAILED
CURLE_WRITE_ERROR
CURLCLOSEPOLICY_CALLBACK
CURLCLOSEPOLICY_LEAST_RECENTLY_USED
CURLCLOSEPOLICY_LEAST_TRAFFIC
CURLCLOSEPOLICY_NONE
CURLCLOSEPOLICY_OLDEST
CURLCLOSEPOLICY_SLOWEST
CURLAUTH_ANY
CURLAUTH_ANYSAFE
CURLAUTH_BASIC
CURLAUTH_DIGEST
CURLAUTH_DIGEST_IE
CURLAUTH_GSSNEGOTIATE
CURLAUTH_NEGOTIATE
CURLAUTH_NONE
CURLAUTH_NTLM
CURLAUTH_NTLM_WB
CURLAUTH_ONLY
);

$WWW::Curl::Easy::headers = "";
$WWW::Curl::Easy::content = "";

sub const_string {
	my ($self, $constant) = @_;
	return constant($constant);
}

sub AUTOLOAD {
    our $AUTOLOAD;
    # This AUTOLOAD is used to 'autoload' constants from the constant()
    # XS function.

    ( my $constname = $AUTOLOAD ) =~ s/.*:://;
    my $value = constant( $constname );
    if($!) {
        croak("Undefined subroutine &$AUTOLOAD called");
    }

    {
        no strict 'refs';
        *{$AUTOLOAD} = sub { $value };
    }
    return $value;
}

sub pushopt {
    my ($self, $option, $value) = @_;
    $self->setopt($option, $value, 1);
}

1;

__END__

Copyright (C) 2000-2005,2008 Daniel Stenberg, Cris Bailiff,
Sebastian Riedel, et al.
 
You may opt to use, copy, modify, merge, publish, distribute and/or sell
copies of the Software, and permit persons to whom the Software is furnished
to do so, under the terms of the MIT license.
